source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Neutron configurations\n»"

sudo mkdir -p $PWD/neutron/backup
sudo cp /etc/neutron/neutron.conf $PWD/neutron/backup/

echo -e "»\n»Configuring the Neutron default options\n»"

sudo crudini --set /etc/neutron/neutron.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/neutron/neutron.conf DEFAULT log_dir /var/log/neutron

sudo crudini --set /etc/neutron/neutron.conf DEFAULT core_plugin ml2
sudo crudini --set /etc/neutron/neutron.conf DEFAULT service_plugins router
sudo crudini --set /etc/neutron/neutron.conf DEFAULT allow_overlapping_ips True

echo -e "»\n»Configuring the Neutron database\n»"

sudo crudini --del /etc/neutron/neutron.conf database sqlite_db
sudo crudini --set /etc/neutron/neutron.conf database connection mysql://neutron:$NEUTRON_DB_PASS@$DB_HOST/neutron

echo -e "»\n»Configuring the Neutron authorization\n»"

sudo crudini --set /etc/neutron/neutron.conf DEFAULT auth_strategy keystone

# Clear all the options of this section
sudo crudini --del /etc/neutron/neutron.conf keystone_authtoken

sudo crudini --set /etc/neutron/neutron.conf keystone_authtoken auth_uri $KEYSTONE_AUTH_URI
sudo crudini --set /etc/neutron/neutron.conf keystone_authtoken auth_url $KEYSTONE_AUTH_URL
sudo crudini --set /etc/neutron/neutron.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/neutron/neutron.conf keystone_authtoken project_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/neutron/neutron.conf keystone_authtoken user_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/neutron/neutron.conf keystone_authtoken project_name $DRY_SERVICE_PROJECT
sudo crudini --set /etc/neutron/neutron.conf keystone_authtoken username neutron
sudo crudini --set /etc/neutron/neutron.conf keystone_authtoken password $NEUTRON_PASS

echo -e "»\n»Configuring the Neutron and Nova communication\n»"

sudo crudini --set /etc/neutron/neutron.conf DEFAULT notify_nova_on_port_status_changes True
sudo crudini --set /etc/neutron/neutron.conf DEFAULT notify_nova_on_port_data_changes True
sudo crudini --set /etc/neutron/neutron.conf DEFAULT nova_url $NOVA_URL

sudo crudini --set /etc/neutron/neutron.conf nova auth_url $KEYSTONE_AUTH_URL
sudo crudini --set /etc/neutron/neutron.conf nova auth_plugin password
sudo crudini --set /etc/neutron/neutron.conf nova project_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/neutron/neutron.conf nova user_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/neutron/neutron.conf nova region_name $DRY_REGION
sudo crudini --set /etc/neutron/neutron.conf nova project_name $DRY_SERVICE_PROJECT
sudo crudini --set /etc/neutron/neutron.conf nova username nova
sudo crudini --set /etc/neutron/neutron.conf nova password $NOVA_PASS

echo -e "»\n»Configuring RabbitMQ for Neutron\n»"

sudo crudini --set /etc/neutron/neutron.conf DEFAULT rpc_backend rabbit

sudo crudini --set /etc/neutron/neutron.conf oslo_messaging_rabbit rabbit_host $DRY_HOST
sudo crudini --set /etc/neutron/neutron.conf oslo_messaging_rabbit rabbit_userid $RABBIT_USER
sudo crudini --set /etc/neutron/neutron.conf oslo_messaging_rabbit rabbit_password $RABBIT_PASS
