source $PWD/configuration.sh

echo -e "»\n» Disabling the Keystone automatic start\n»"

echo "manual" | sudo tee /etc/init/keystone.override

echo -e "»\n» Installing Keystone packages\n»"

sudo apt-get install -y keystone python-openstackclient apache2 libapache2-mod-wsgi memcached python-memcache

echo -e "»\n» Removing useless Keystone SQLite database\n»"

sudo rm -f /var/lib/keystone/keystone.db
