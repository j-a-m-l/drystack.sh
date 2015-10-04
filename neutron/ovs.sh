source $PWD/configuration.sh

echo -e "»\n» Create the OVS bridges and ports\n»"

sudo ovs-vsctl add-br 'br-int'

sudo ovs-vsctl add-br $NEUTRON_FLAT_BRIDGE
sudo ovs-vsctl add-port $NEUTRON_FLAT_BRIDGE $DRY_OVS_INTERFACE

# sudo ovs-vsctl add-br $NEUTRON_INTERFACE_BRIDGE
# sudo ovs-vsctl add-port $NEUTRON_INTERFACE_INTERNAL $NEUTRON_INTERFACE_INTERNAL
