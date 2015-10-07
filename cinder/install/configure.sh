source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Glance configurations\n»"

sudo mkdir -p $PWD/cinder/backup
sudo cp /etc/cinder/cinder.conf $PWD/cinder/backup/cinder-configure.conf

echo -e "»\n» Configuring the Cinder default options\n»"

sudo crudini --set /etc/cinder/cinder.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/cinder/cinder.conf DEFAULT log_dir /var/log/cinder

sudo crudini --set /etc/cinder/cinder.conf DEFAULT my_ip $DRY_IP

sudo crudini --set /etc/cinder/cinder.conf DEFAULT glance_host $DRY_IP

sudo crudini --set /etc/cinder/cinder.conf DEFAULT osapi_volume_workders $CINDER_CPU_THREADS

echo -e "»\n» Configuring the Cinder database\n»"

sudo crudini --del /etc/cinder/cinder.conf database sqlite_db
sudo crudini --set /etc/cinder/cinder.conf database connection mysql://cinder:$CINDER_DB_PASS@$DB_HOST/cinder

echo -e "»\n» Configuring the Cinder authorization\n»"

sudo crudini --set /etc/cinder/cinder.conf DEFAULT auth_strategy keystone

# Clear all the options of this section
sudo crudini --del /etc/cinder/cinder.conf keystone_authtoken

sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken auth_uri $KEYSTONE_AUTH_URI
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken auth_url $KEYSTONE_AUTH_URL
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken project_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken user_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken project_name $DRY_SERVICE_PROJECT
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken username cinder
sudo crudini --set /etc/cinder/cinder.conf keystone_authtoken password $CINDER_PASS

echo -e "»\n» Configuring RabbitMQ for Cinder\n»"

sudo crudini --set /etc/cinder/cinder.conf DEFAULT rpc_backend rabbit

sudo crudini --set /etc/cinder/cinder.conf oslo_messaging_rabbit rabbit_host $DRY_HOST
sudo crudini --set /etc/cinder/cinder.conf oslo_messaging_rabbit rabbit_userid $RABBIT_USER
sudo crudini --set /etc/cinder/cinder.conf oslo_messaging_rabbit rabbit_password $RABBIT_PASS

sudo crudini --set /etc/cinder/cinder.conf oslo_concurrency lock_path /var/lock/cinder
