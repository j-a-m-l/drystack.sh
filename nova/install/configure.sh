source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Glance configurations\n»"

sudo mkdir -p $PWD/nova/backup
sudo cp /etc/nova/nova.conf $PWD/nova/backup/

echo -e "»\n» Configuring the Nova default options\n»"

sudo crudini --set /etc/nova/nova.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/nova/nova.conf DEFAULT log_dir /var/log/nova

sudo crudini --set /etc/nova/nova.conf DEFAULT my_ip $DRY_IP

sudo crudini --set /etc/nova/nova.conf DEFAULT vnc_enabled True
sudo crudini --set /etc/nova/nova.conf DEFAULT vncserver_listen 0.0.0.0
sudo crudini --set /etc/nova/nova.conf DEFAULT vncserver_proxyclient_address $NOVA_VNC_ADDRESS
sudo crudini --set /etc/nova/nova.conf DEFAULT novncproxy_base_url $NOVA_NON_VNC_URL

sudo crudini --set /etc/nova/nova.conf glance host $DRY_HOST

echo -e "»\n» Configuring the Nova database\n»"

sudo crudini --del /etc/nova/nova.conf database sqlite_db
sudo crudini --set /etc/nova/nova.conf database connection mysql://nova:$NOVA_DB_PASS@$DB_HOST/nova

echo -e "»\n» Configuring the Nova authorization\n»"

sudo crudini --set /etc/nova/nova.conf DEFAULT auth_strategy keystone

# Clear all the options of this section
sudo crudini --del /etc/nova/nova.conf keystone_authtoken

sudo crudini --set /etc/nova/nova.conf keystone_authtoken auth_uri $KEYSTONE_AUTH_URI
sudo crudini --set /etc/nova/nova.conf keystone_authtoken auth_url $KEYSTONE_AUTH_URL
sudo crudini --set /etc/nova/nova.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/nova/nova.conf keystone_authtoken project_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/nova/nova.conf keystone_authtoken user_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/nova/nova.conf keystone_authtoken project_name $DRY_SERVICE_PROJECT
sudo crudini --set /etc/nova/nova.conf keystone_authtoken username nova
sudo crudini --set /etc/nova/nova.conf keystone_authtoken password $NOVA_PASS

echo -e "»\n» Configuring RabbitMQ for Nova\n»"

sudo crudini --set /etc/nova/nova.conf DEFAULT rpc_backend rabbit

sudo crudini --set /etc/nova/nova.conf oslo_messaging_rabbit rabbit_host $DRY_HOST
sudo crudini --set /etc/nova/nova.conf oslo_messaging_rabbit rabbit_userid $RABBIT_USER
sudo crudini --set /etc/nova/nova.conf oslo_messaging_rabbit rabbit_password $RABBIT_PASS

sudo crudini --set /etc/nova/nova.conf oslo_concurrency lock_path /var/lib/nova/tmp


echo -e "»\n» Saving the Nova configuration to the database\n»"

sudo nova-manage db sync

echo -e "»\n» Restarting Nova services\n»"

sudo service nova-api restart
sudo service nova-cert restart
sudo service nova-consoleauth restart
sudo service nova-scheduler restart
sudo service nova-conductor restart
sudo service nova-novncproxy restart
sudo service nova-compute restart
