source $PWD/configuration.sh

echo -e "»\n»Creating the Nova database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE nova;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' IDENTIFIED BY '$NOVA_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY '$NOVA_DB_PASS';"

echo -e "»\n»Creating the Nova user\n»"

openstack user create --password $NOVA_PASS nova
openstack role add --user nova --project service admin

echo -e "»\n»Creating the Compute service\n»"

openstack service create \
	--name nova \
	--description "OpenStack Compute Service" \
	compute

echo -e "»\n»Creating the Compute endpoint\n»"

openstack endpoint create \
	--publicurl $NOVA_ENDPOINT \
	--internalurl $NOVA_ENDPOINT \
	--adminurl $NOVA_ENDPOINT \
	--region $DRY_REGION \
	compute

echo -e "»\n»Installing Nova packages\n»"

sudo apt-get install -y nova-api nova-cert nova-conductor nova-consoleauth nova-novncproxy nova-scheduler python-novaclient nova-compute sysfsutils
