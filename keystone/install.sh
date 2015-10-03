source $PWD/configuration.sh

echo -e "»\n»Creating the Keystone database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE keystone;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY '$KEYSTONE_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY '$KEYSTONE_DB_PASS';"

echo -e "»\n»Installing Keystone packages\n»"

sudo apt-get install -y keystone python-openstackclient apache2 libapache2-mod-wsgi memcached python-memcache
