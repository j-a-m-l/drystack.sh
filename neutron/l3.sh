source $PWD/configuration.sh

echo -e "»\n»Configuring the Neutron L3 agent\n»"

sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT verbose True
sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT interface_driver neutron.agent.linux.interface.OVSInterfaceDriver

# TODO
# sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT router_delete_namespaces True
sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT use_namespaces True
