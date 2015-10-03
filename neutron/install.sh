source $PWD/configuration.sh

echo -e "»\n»Creating the Neutron database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE neutron;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' IDENTIFIED BY '$NEUTRON_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' IDENTIFIED BY '$NEUTRON_DB_PASS';"

echo -e "»\n»Creating the Neutron user\n»"

openstack user create --password $NEUTRON_PASS neutron
openstack role add --user neutron --project service admin

echo -e "»\n»Creating the Network service\n»"

openstack service create \
	--name neutron \
	--description "OpenStack Network Service" \
	network

echo -e "»\n»Creating the Network endpoint\n»"

openstack endpoint create \
	--publicurl $NEUTRON_ENDPOINT \
	--internalurl $NEUTRON_ENDPOINT \
	--adminurl $NEUTRON_ENDPOINT \
	--region $DRY_REGION \
	network

echo -e "»\n»Installing Neutron packages\n»"

sudo apt-get install -y neutron-server python-neutronclient neutron-plugin-ml2 neutron-plugin-openvswitch-agent neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent
