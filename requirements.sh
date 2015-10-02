source ./configuration.sh

echo -e "»\n» Updating packages\n»"

sudo apt-get install -y software-properties-common ubuntu-cloud-keyring
sudo add-apt-repository cloud-archive:kilo
sudo apt-get update

echo -e "»\n» crudini (easiest way of manipulating the configuration files)\n»"

sudo apt-get -y install crudini

echo -e "»\n» Installing and configuring MariaDB\n»"

sudo apt-get -y install mariadb-server python-mysqldb

sudo sed -i '/^bind-address/s/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf

echo "[mysqld]
default-storage-engine = innodb
innodb_file_per_table
collation-server = utf8_general_ci
init-connect = 'SET NAMES utf8'
character-set-server = utf8" | sudo tee /etc/mysql/conf.d/openstack.cnf

sudo service mysql restart

echo -e "»\n» Installing and configuring RabbitMQ\n»"

sudo apt-get install -y rabbitmq-server
sudo rabbitmqctl change_password guest $RABBIT_PASS

echo -e "»\n» Installing some network tools\n»"

sudo apt-get install -y ntp vlan bridge-utils

echo -e "»\n Configuring system setting variables\n»"

echo "net.ipv4.ip_forward=1
net.ipv4.conf.all.rp_filter=0
net.ipv4.conf.default.rp_filter=0" | sudo tee -a /etc/sysctl.conf

sudo sysctl -p
