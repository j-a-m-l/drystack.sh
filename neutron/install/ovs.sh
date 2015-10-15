source $PWD/configuration.sh

echo -e "»\n» Restarting the Open vSwitch service\n»"

sudo service openvswitch-switch restart

echo -e "»\n» Create the OVS bridges and ports\n»"

# Sometimes this bridge is already created
sudo ovs-vsctl add-br 'br-int'

# VLAN
# sudo ovs-vsctl add-br $NEUTRON_FLAT_BRIDGE
# sudo ovs-vsctl add-port $NEUTRON_FLAT_BRIDGE $DRY_EX_INTERFACE
# 
# sudo ovs-vsctl add-br $NEUTRON_VLAN_BRIDGE
# sudo ovs-vsctl add-port $NEUTRON_VLAN_BRIDGE $DRY_VINT_INTERFACE

# FLAT only
sudo ovs-vsctl add-br $NEUTRON_FLAT_BRIDGE
sudo ovs-vsctl add-port $NEUTRON_FLAT_BRIDGE $DRY_EX_INTERFACE
