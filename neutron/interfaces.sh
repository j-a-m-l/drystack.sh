source $PWD/configuration.sh

echo -e "»\n» Configure '/etc/network/interfaces'\n»"

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
auto $DRY_HOST_INTERFACE
iface $DRY_HOST_INTERFACE inet static
address $DRY_HOST_IP
network $DRY_HOST_NETMASK
gateway $DRY_HOST_GATEWAY
broadcast $DRY_HOST_BROADCAST
netmask $DRY_HOST_NETMASK
dns-nameservers 8.8.8.8

# The secondary network interface that connects interfaces
auto $DRY_OVS_INTERFACE
iface $DRY_OVS_INTERFACE inet manual
ovs_bridge $NEUTRON_FLAT_BRIDGE
ovs_type OVSPort
address 0.0.0.0

auto $NEUTRON_FLAT_BRIDGE
iface $NEUTRON_FLAT_BRIDGE inet static
address $DRY_OVS_IP
network $DRY_OVS_NETWORK
gateway $DRY_OVS_GATEWAY
broadcast $DRY_OVS_BROADCAST
netmask $DRY_OVS_NETMASK
dns-nameservers 8.8.8.8
ovs_type OVSPort
ovs_ports $NEUTRON_FLAT_BRIDGE
bridge_stp off
bridge_fd 0
bridge_maxwait 0
" | sudo tee /etc/network/interfaces

echo -e "»\n» Reloading the interfaces\n»"

sudo ifdown em1 em2 br-ex
sudo ifup em1 em2 br-ex
