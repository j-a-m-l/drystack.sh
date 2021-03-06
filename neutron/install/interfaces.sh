source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the network interfaces configurations\n»"

sudo mkdir -p $PWD/neutron/backup
sudo cp /etc/network/interfaces $PWD/neutron/backup/

echo -e "»\n» Configuring '/etc/network/interfaces'\n»"

# VLAN
# echo "
# # This file describes the network interfaces available on your system
# # and how to activate them. For more information, see interfaces(5).
# 
# #
# # Modified by DRYStack.sh
# #
# 
# # The loopback network interface
# auto lo
# iface lo inet loopback
# 
# # The primary network interface (external)
# auto $DRY_EX_INTERFACE
# iface $DRY_EX_INTERFACE inet manual
# ovs_bridge $NEUTRON_FLAT_BRIDGE
# ovs_type OVSPort
# address 0.0.0.0
# 
# auto $NEUTRON_FLAT_BRIDGE
# iface $NEUTRON_FLAT_BRIDGE inet static
# address $DRY_EX_IP
# network $DRY_EX_NETWORK
# gateway $DRY_EX_GATEWAY
# broadcast $DRY_EX_BROADCAST
# netmask $DRY_EX_NETMASK
# dns-nameservers 8.8.8.8
# ovs_type OVSPort
# ovs_ports $DRY_EX_INTERFACE
# bridge_stp off
# bridge_fd 0
# bridge_maxwait 0
# 
# # The secondary network (internal)
# auto $DRY_VINT_INTERFACE
# iface $DRY_VINT_INTERFACE inet manual
# ovs_bridge $NEUTRON_VLAN_BRIDGE
# ovs_type OVSPort
# address 0.0.0.0
# 
# auto $NEUTRON_VLAN_BRIDGE
# iface $NEUTRON_VLAN_BRIDGE inet static
# address $DRY_VINT_IP
# network $DRY_VINT_NETWORK
# gateway $DRY_VINT_GATEWAY
# broadcast $DRY_VINT_BROADCAST
# netmask $DRY_VINT_NETMASK
# dns-nameservers 8.8.8.8
# ovs_type OVSPort
# ovs_ports $DRY_VINT_INTERFACE
# bridge_stp off
# bridge_fd 0
# bridge_maxwait 0
# " | sudo tee /etc/network/interfaces


echo "
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

#
# Modified by DRYStack.sh
#

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto $DRY_UN_INTERFACE
iface $DRY_UN_INTERFACE inet dhcp

# The secondary network
auto $DRY_EX_INTERFACE
iface $DRY_EX_INTERFACE inet manual
	up ifconfig \$IFACE 0.0.0.0 up
	up ip link set \$IFACE promisc on
	down ip link set \$IFACE promisc off
	down ifconfig \$IFACE down

auto $NEUTRON_FLAT_BRIDGE
iface $NEUTRON_FLAT_BRIDGE inet static
	address $DRY_EX_IP
	netmask $DRY_EX_NETMASK
	up ip link set \$IFACE promisc on
	down ip link set \$IFACE promisc off

" | sudo tee /etc/network/interfaces

echo -e "»\n» Reloading the interfaces\n»"

# VLAN
# sudo ifdown $DRY_EX_INTERFACE $DRY_VINT_INTERFACE $NEUTRON_FLAT_BRIDGE $NEUTRON_VLAN_BRIDGE
# sudo ifup $DRY_EX_INTERFACE $DRY_VINT_INTERFACE $NEUTRON_FLAT_BRIDGE $NEUTRON_VLAN_BRIDGE

# FLAT only
sudo ifdown $DRY_EX_INTERFACE $NEUTRON_FLAT_BRIDGE $DRY_UN_INTERFACE
sudo ifup $DRY_EX_INTERFACE $NEUTRON_FLAT_BRIDGE $DRY_UN_INTERFACE
