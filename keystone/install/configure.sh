source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Keystone configuration\n»"

sudo mkdir -p $PWD/keystone/backup
sudo cp /etc/keystone/keystone.conf $PWD/keystone/backup/

echo -e "»\n» Configuring the Keystone default options\n»"

sudo crudini --set /etc/keystone/keystone.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/keystone/keystone.conf DEFAULT log_dir /var/log/keystone
sudo crudini --set /etc/keystone/keystone.conf DEFAULT admin_token $DRY_TEMPORAL_TOKEN

echo -e "»\n» Configuring the Keystone database\n»"

sudo crudini --set /etc/keystone/keystone.conf database connection mysql://keystone:$KEYSTONE_DB_PASS@$DB_IP/keystone

echo -e "»\n» Configuring the Keystone token management\n»"

sudo crudini --set /etc/keystone/keystone.conf token provider keystone.token.providers.uuid.Provider
sudo crudini --set /etc/keystone/keystone.conf token driver keystone.token.persistence.backends.memcache.Token

sudo crudini --set /etc/keystone/keystone.conf revoke driver keystone.contrib.revoke.backends.sql.Revoke

sudo crudini --set /etc/keystone/keystone.conf memcache servers $DRY_IP:11211

echo -e "»\n» Configuring other Keystone options\n»"

sudo crudini --set /etc/keystone/keystone.conf extra_headers Distribution Ubuntu

echo -e "»\n» Saving the configuration to the database\n»"
echo $KEYSTONE_DB_PASS

# su -s /bin/sh -c "keystone-manage db_sync" keystone
sudo  keystone-manage db_sync
