source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Glance configurations\n»"

sudo mkdir -p $PWD/glance/backup
sudo cp /etc/glance/glance-api.conf $PWD/glance/backup/
sudo cp /etc/glance/glance-registry.conf $PWD/glance/backup/

echo -e "»\n» Configuring the Glance API default options\n»"

sudo crudini --set /etc/glance/glance-api.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/glance/glance-api.conf DEFAULT log_dir /var/log/glance
# Is used by the telemetry service
sudo crudini --set /etc/glance/glance-api.conf DEFAULT notification_driver noop

echo -e "»\n» Configuring the Glance API database\n»"

sudo crudini --del /etc/glance/glance-api.conf database sqlite_db
sudo crudini --set /etc/glance/glance-api.conf database connection mysql://glance:$GLANCE_DB_PASS@$DB_HOST/glance

echo -e "»\n» Configuring the Glance API authorization\n»"

# Clear all the options of this section
sudo crudini --del /etc/glance/glance-api.conf keystone_authtoken

sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken auth_uri $KEYSTONE_AUTH_URI
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken auth_url $KEYSTONE_AUTH_URL
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken project_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken user_domain_id $DRY_ADMIN_DOMAIN
# sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken project_domain_name $DRY_ADMIN_DOMAIN
# sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken user_domain_name $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken project_name $DRY_SERVICE_PROJECT
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken username glance
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken password $GLANCE_PASS

sudo crudini --set /etc/glance/glance-api.conf paste_deploy flavor keystone

echo -e "»\n» Configuring the Glance API store options\n»"

sudo crudini --set /etc/glance/glance-api.conf glance_store default_store file
sudo crudini --set /etc/glance/glance-api.conf glance_store filesystem_store_datadir /var/lib/glance/images/

echo -e "»\n» Configuring the Glance API configuration for RabbitMQ\n»"

sudo crudini --set /etc/glance/glance-api.conf DEFAULT rabbit_userid $RABBIT_USER
sudo crudini --set /etc/glance/glance-api.conf DEFAULT rabbit_password $RABBIT_PASS


echo -e "»\n» Configuring the Glance registry default options\n»"

sudo crudini --set /etc/glance/glance-registry.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/glance/glance-registry.conf DEFAULT log_dir /var/log/glance
# Is used by the telemetry service
sudo crudini --set /etc/glance/glance-registry.conf DEFAULT notification_driver noop

echo -e "»\n» Configuring the Glance registry database\n»"

sudo crudini --del /etc/glance/glance-registry.conf database sqlite_db
sudo crudini --set /etc/glance/glance-registry.conf database connection mysql://glance:$GLANCE_DB_PASS@$DB_HOST/glance

echo -e "»\n» Configuring the Glance registry authorization\n»"

# Clear all the options of this section
sudo crudini --del /etc/glance/glance-registry.conf keystone_authtoken

sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken auth_uri $KEYSTONE_AUTH_URI
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken auth_url $KEYSTONE_AUTH_URL
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken project_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken user_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken project_name $DRY_SERVICE_PROJECT
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken username glance
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken password $GLANCE_PASS

sudo crudini --set /etc/glance/glance-registry.conf paste_deploy flavor keystone


echo -e "»\n» Saving the configuration to the database\n»"

sudo glance-manage db_sync

echo -e "»\n» Restarting Glance services\n»"

sudo service glance-registry restart
sudo service glance-api restart
