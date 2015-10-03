source $PWD/configuration.sh

echo -e "»\n»Configuring the Neutron DHCP agent\n»"

sudo crudini --set /etc/neutron/dhcp_agent.ini DEFAULT verbose True
sudo crudini --set /etc/neutron/dhcp_agent.ini DEFAULT interface_driver neutron.agent.linux.interface.OVSInterfaceDriver
sudo crudini --set /etc/neutron/dhcp_agent.ini DEFAULT dhcp_driver neutron.agent.linux.dhcp.Dnsmasq

# TODO
# sudo crudini --set /etc/neutron/dhcp_agent.ini DEFAULT dhcp_delete_namespaces True
# sudo crudini --set /etc/neutron/dhcp_agent.ini DEFAULT use_namespaces True

# TODO MTU?
