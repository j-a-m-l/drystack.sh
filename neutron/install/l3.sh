source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Neutron L3 configurations\n»"

sudo mkdir -p $PWD/neutron/backup
sudo cp /etc/neutron/l3_agent.ini $PWD/neutron/backup/

echo -e "»\n»Configuring the Neutron L3 agent\n»"

sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT verbose True

sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT interface_driver neutron.agent.linux.interface.OVSInterfaceDriver

# TODO error prone?
# sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT external_network_bridge

# TODO
# sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT router_delete_namespaces True
sudo crudini --set /etc/neutron/l3_agent.ini DEFAULT use_namespaces True
