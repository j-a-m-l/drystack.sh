source $PWD/configuration.sh

echo -e "»\n»Configuring the Neutron ML2 plug-in\n»"

sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 type_drivers flat,vlan
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 tenant_network_types vlan,flat
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 mechanism_drivers openvswitch

sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2_type_flat flat_networks $NEUTRON_EXTERNAL_NET

sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2_type_vlan network_vlan_ranges "$NEUTRON_INTERNAL_NET:$NEUTRON_VLAN_RANGE"

echo -e "»\n»Configuring the Neutron ML2 plug-in security group\n»"

sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini securitygroup enable_security_group True
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini securitygroup enable_ipset True
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini securitygroup firewall_driver neutron.agent.linux.iptables_firewall.OVSHybridIptablesFirewallDriver

echo -e "»\n»Configuring the Neutron ML2 plug-in OVS options\n»"

# TODO "IP address of the instance tunnels network interface" for tunnel_types = gre?
# sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ovs local_ip $DRY_IP
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ovs bridge_mappings "$NEUTRON_EXTERNAL_NET:$NEUTRON_EXTERNAL_BRIDGE,$NEUTRON_INTERNAL_NET:$NEUTRON_INTERNAL_BRIDGE"
