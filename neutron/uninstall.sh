source $PWD/configuration.sh

echo -e "»\n» Enabling the temporary authentication token mechanism\n»"

sudo crudini --set /etc/keystone/keystone-paste.ini pipeline:public_api admin_token_auth $DRY_TEMPORAL_TOKEN
sudo crudini --set /etc/keystone/keystone-paste.ini pipeline:admin_api admin_token_auth $DRY_TEMPORAL_TOKEN
sudo crudini --set /etc/keystone/keystone-paste.ini pipeline:api_v3 admin_token_auth $DRY_TEMPORAL_TOKEN

echo -e "»\n» Removing the 'open' security group\n»"

neutron security-group-delete open

echo -e "»\n» Removing the router\n»"

neutron router-interface-delete $NEUTRON_ROUTER $NEUTRON_PRIVATE_SUBNET_NAME
neutron router-delete $NEUTRON_ROUTER

echo -e "»\n» Removing the networks\n»"

neutron subnet-delete $NEUTRON_PUBLIC_SUBNET_NAME
neutron subnet-delete $NEUTRON_PRIVATE_SUBNET_NAME
neutron net-delete $NEUTRON_PUBLIC_NET
neutron net-delete $NEUTRON_PRIVATE_NET

echo -e "»\n» Removing the OVS bridges and ports\n»"

# sudo ovs-vsctl del-br 'br-int'
sudo ovs-vsctl del-br $NEUTRON_FLAT_BRIDGE
sudo ovs-vsctl del-br $NEUTRON_VLAN_BRIDGE

# TODO 
echo -e "»\n» Removing the Neutron configuration\n»"

# TODO optional
echo -e "»\n» Uninstalling the Neutron packages\n»"

echo -e "»\n» Deleting the Neutron user, service and endpoint\n»"

openstack user delete neutron
openstack service delete network
# TODO works, but triggers error
openstack endpoint delete `openstack endpoint list | grep neutron | awk '{ print $2 }' | head -n1`

echo -e "»\n» Stopping Neutron services\n»"

sudo service neutron-server stop
sudo service neutron-plugin-openvswitch-agent stop
sudo service neutron-l3-agent stop
sudo service neutron-dhcp-agent stop
sudo service neutron-metadata-agent stop

echo -e "»\n» Deleting the Neutron database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS neutron;"

echo -e "»\n» Configuring '/etc/network/interfaces'\n»"

echo "
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

#
# Modified by DRYStack.sh
#

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface (external)
auto $DRY_EX_INTERFACE
iface $DRY_EX_INTERFACE inet dhcp
" | sudo tee /etc/network/interfaces

echo -e "»\n» Reloading the interfaces\n»"

sudo ifdown $DRY_EX_INTERFACE $DRY_VINT_INTERFACE $NEUTRON_FLAT_BRIDGE $NEUTRON_VLAN_BRIDGE
sudo ifup $DRY_EX_INTERFACE
