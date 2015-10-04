source $PWD/configuration.sh

echo -e "»\n» Configuring the Cinder default options\n»"

sudo crudini --set /etc/cinder/cinder.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/cinder/cinder.conf DEFAULT log_dir /var/log/cinder

sudo crudini --set /etc/cinder/cinder.conf DEFAULT my_ip $DRY_IP

sudo crudini --set /etc/cinder/cinder.conf DEFAULT glance_host $DRY_IP

echo -e "»\n» Configuring the Cinder database\n»"

sudo crudini --del /etc/cinder/cinder.conf database sqlite_db
sudo crudini --set /etc/cinder/cinder.conf database connection mysql://cinder:$CINDER_DB_PASS@$DB_IP/cinder

echo -e "»\n» Configuring the Cinder authorization\n»"

sudo crudini --set /etc/cinder/cinder.conf DEFAULT auth_strategy keystone

sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken auth_uri $KEYSTONE_INTERNAL_URL
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken auth_url $KEYSTONE_ADMIN_URL
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken project_domain_id default
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken user_domain_id default
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken project_name service
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken username cinder
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken password $CINDER_PASS

echo -e "»\n» Configuring RabbitMQ for Cinder\n»"

sudo crudini --set /etc/cinder/cinder.conf DEFAULT rpc_backend rabbit

sudo crudini --set /etc/cinder/cinder.conf oslo_messaging_rabbit rabbit_host $CINDER_SERVER_NAME
sudo crudini --set /etc/cinder/cinder.conf oslo_messaging_rabbit rabbit_userid $RABBIT_USER
sudo crudini --set /etc/cinder/cinder.conf oslo_messaging_rabbit rabbit_password $RABBIT_PASS

sudo crudini --set /etc/cinder/cinder.conf oslo_concurrency lock_path /var/lib/cinder/tmp
