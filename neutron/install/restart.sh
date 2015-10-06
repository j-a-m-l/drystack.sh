source $PWD/configuration.sh

echo -e "»\n» Restarting Nova and Neutron services\n»"

sudo service nova-api restart
sudo service nova-compute restart

sudo service neutron-server restart
sudo service neutron-plugin-openvswitch-agent restart
sudo service neutron-l3-agent restart
sudo service neutron-dhcp-agent restart
sudo service neutron-metadata-agent restart
