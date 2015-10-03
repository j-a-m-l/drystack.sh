source $PWD/configuration.sh

# Temporal authentication token
DRY_SERVICE_TOKEN='ADMIN_TOKEN'
DRY_SERVICE_ENDPOINT=$OS_AUTH_URL

echo -e "»\n»Installing Keystone packages\n»"

sudo apt-get install -y keystone python-openstackclient apache2 libapache2-mod-wsgi memcached python-memcache

echo -e "»\n»Creating the Keystone database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE keystone;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY '$KEYSTONE_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY '$KEYSTONE_DB_PASS';"

echo -e "»\n»Configuring the Keystone default options\n»"

sudo crudini --set /etc/keystone/keystone.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/keystone/keystone.conf DEFAULT log_dir /var/log/keystone
sudo crudini --set /etc/keystone/keystone.conf DEFAULT admin_token $DRY_SERVICE_TOKEN

echo -e "»\n»Configuring the Keystone database\n»"

sudo crudini --set /etc/keystone/keystone.conf database connection mysql://keystone:$KEYSTONE_DB_PASS@$DB_IP/keystone

echo -e "»\n»Configuring the Keystone token management\n»"

sudo crudini --set /etc/keystone/keystone.conf token provider keystone.token.providers.uuid.Provider
sudo crudini --set /etc/keystone/keystone.conf token driver keystone.token.persistence.backends.memcache.Token

sudo crudini --set /etc/keystone/keystone.conf revoke driver keystone.contrib.revoke.backends.sql.Revoke

sudo crudini --set /etc/keystone/keystone.conf memcache servers localhost:11211

echo -e "»\n»Configuring other Keystone options\n»"

sudo crudini --set /etc/keystone/keystone.conf extra_headers Distribution Ubuntu

echo -e "»\n»Disabling the Keystone automatic start\n»"

# TODO ensure this
echo "manual" | sudo tee /etc/init/keystone.override

echo -e "»\n»Removing useless Keystone SQLite database\n»"

sudo rm -f /var/lib/keystone/keystone.db

echo -e "»\n»Restarting Keystone and saving the configuration to the database\n»"

sudo keystone-manage db_sync

sudo service keystone restart
