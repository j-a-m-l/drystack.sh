source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Neutron ML2 configurations\n»"

sudo mkdir -p $PWD/neutron/backup
sudo cp /etc/neutron/plugins/ml2/ml2_conf.ini $PWD/neutron/backup/

echo -e "»\n»Configuring the Neutron ML2 plug-in\n»"

sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 type_drivers local,flat,vlan
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 tenant_network_types flat,vlan
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 mechanism_drivers openvswitch

sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2_type_flat flat_networks $NEUTRON_FLAT_NET

# VLAN
# sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2_type_vlan network_vlan_ranges "$NEUTRON_VLAN_NET:$NEUTRON_VLAN_RANGE"

echo -e "»\n»Configuring the Neutron ML2 plug-in security group\n»"

sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini securitygroup enable_security_group True
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini securitygroup enable_ipset True
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini securitygroup firewall_driver neutron.agent.linux.iptables_firewall.OVSHybridIptablesFirewallDriver

echo -e "»\n»Configuring the Neutron ML2 plug-in OVS options\n»"

# TODO error prone?

sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ovs local_ip $DRY_IP

# VLAN
# sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ovs bridge_mappings "$NEUTRON_FLAT_NET:$NEUTRON_FLAT_BRIDGE,$NEUTRON_VLAN_NET:$NEUTRON_VLAN_BRIDGE"

# FLAT only
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ovs bridge_mappings "$NEUTRON_FLAT_NET:$NEUTRON_FLAT_BRIDGE"
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ovs network_vlan_ranges $NEUTRON_FLAT_NET

# sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ovs enable_tunneling False
