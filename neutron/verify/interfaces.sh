source $PWD/configuration.sh

echo -e "»\n» Ping to flat interface\n»"

ping -c 4 $DRY_EX_IP

echo -e "»\n» Ping to VLAN interface\n»"

ping -c 4 $DRY_VINT_IP

echo -e "»\n» Ping to the router\n»"

ping -c 4 $NEUTRON_FLOATING_IP_START

echo -e "»\n» Ping to an external openstack.org\n»"

ping -c 4 'ubuntu.com'
