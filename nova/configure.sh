source $PWD/configuration.sh

echo -e "»\n»Configuring the Nova default options\n»"

sudo crudini --set /etc/nova/nova.conf DEFAULT verbose $DRY_VERBOSE
sudo crudini --set /etc/nova/nova.conf DEFAULT log_dir /var/log/nova

sudo crudini --set /etc/nova/nova.conf DEFAULT my_ip $DRY_IP

sudo crudini --set /etc/nova/nova.conf DEFAULT vnc_enabled True
sudo crudini --set /etc/nova/nova.conf DEFAULT vncserver_listen $DRY_IP
sudo crudini --set /etc/nova/nova.conf DEFAULT vncserver_proxyclient_address $DRY_IP
sudo crudini --set /etc/nova/nova.conf DEFAULT novncproxy_base_url $NOVA_NON_VNC_URL

sudo crudini --set /etc/nova/nova.conf glance host $NOVA_SERVER_NAME

echo -e "»\n»Configuring the Nova database\n»"

sudo crudini --del /etc/nova/nova.conf database sqlite_db
sudo crudini --set /etc/nova/nova.conf database connection mysql://nova:$NOVA_DB_PASS@$DB_IP/nova

echo -e "»\n»Configuring the Nova authorization\n»"

sudo crudini --set /etc/nova/nova.conf DEFAULT auth_strategy keystone

sudo crudini --set /etc/nova/nova.conf keystone_authtoken auth_uri $KEYSTONE_INTERNAL_URL
sudo crudini --set /etc/nova/nova.conf keystone_authtoken auth_url $KEYSTONE_ADMIN_URL
sudo crudini --set /etc/nova/nova.conf keystone_authtoken auth_plugin password
sudo crudini --set /etc/nova/nova.conf keystone_authtoken project_domain_id default
sudo crudini --set /etc/nova/nova.conf keystone_authtoken user_domain_id default
sudo crudini --set /etc/nova/nova.conf keystone_authtoken project_name service
sudo crudini --set /etc/nova/nova.conf keystone_authtoken username nova
sudo crudini --set /etc/nova/nova.conf keystone_authtoken password $NOVA_PASS

echo -e "»\n»Configuring RabbitMQ for Nova\n»"

sudo crudini --set /etc/nova/nova.conf DEFAULT rpc_backend rabbit

sudo crudini --set /etc/nova/nova.conf oslo_messaging_rabbit rabbit_host $NOVA_SERVER_NAME
sudo crudini --set /etc/nova/nova.conf oslo_messaging_rabbit rabbit_userid $RABBIT_USER
sudo crudini --set /etc/nova/nova.conf oslo_messaging_rabbit rabbit_password $RABBIT_PASS

sudo crudini --set /etc/nova/nova.conf oslo_concurrency lock_path /var/lib/nova/tmp
