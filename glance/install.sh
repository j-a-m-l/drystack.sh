source $PWD/configuration.sh

echo -e "»\n» Creating the Glance database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE glance;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' IDENTIFIED BY '$GLANCE_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' IDENTIFIED BY '$GLANCE_DB_PASS';"

echo -e "»\n» Creating the Glance user\n»"

keystone user-create --name=glance --pass=$GLANCE_PASS
keystone user-role-add --user=glance --tenant=service --role=admin

echo -e "»\n» Creating the Image service\n»"

keystone service-create \
	--name=glance \
	--type=image \
	--description="Glance Image Service"

echo -e "»\n» Creating the Image endpoint\n»"

keystone endpoint-create \
	--service=glance \
	--publicurl=$GLANCE_ENDPOINT \
	--internalurl=$GLANCE_ENDPOINT \
	--adminurl=$GLANCE_ENDPOINT \
	--region=$DRY_REGION

echo -e "»\n» Installing Glance packages\n»"

sudo apt-get install -y glance


echo -e "»\n» Configuring the Glance API default options\n»"

sudo crudini --set /etc/glance/glance-api.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/glance/glance-api.conf DEFAULT log_dir /var/log/glance
# Is used by the telemetry service
sudo crudini --set /etc/glance/glance-api.conf DEFAULT notification_driver noop

echo -e "»\n» Configuring the Glance API database\n»"

sudo crudini --del /etc/glance/glance-api.conf database sqlite_db
sudo crudini --set /etc/glance/glance-api.conf database connection mysql://glance:$GLANCE_DB_PASS@$DB_IP/glance

echo -e "»\n» Configuring the Glance API authorization\n»"

sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken auth_uri $KEYSTONE_INTERNAL_URL
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken auth_url $KEYSTONE_ADMIN_URL
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken project_domain_id default
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken user_domain_id default
sudo crudini --set /etc/glance/glance-api.conf keystone_authtoken project_name service
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
sudo crudini --set /etc/glance/glance-registry.conf database connection mysql://glance:$GLANCE_DB_PASS@$DB_IP/glance

echo -e "»\n» Configuring the Glance registry authorization\n»"

sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken auth_uri $KEYSTONE_INTERNAL_URL
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken auth_url $KEYSTONE_ADMIN_URL
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken project_domain_id default
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken user_domain_id default
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken project_name service
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken username glance
sudo crudini --set /etc/glance/glance-registry.conf keystone_authtoken password $GLANCE_PASS

sudo crudini --set /etc/glance/glance-registry.conf paste_deploy flavor keystone


echo -e "»\n» Removing useless Glance SQLite database\n»"

sudo rm -f /var/lib/glance/glance.sqlite

echo -e "»\n» Restarting Glance and saving the configuration to the database\n»"

sudo glance-manage db_sync

sudo service glance-registry restart
sudo service glance-api restart
