source $PWD/configuration.sh

echo -e "»\n»Installing Neutron packages\n»"

sudo apt-get install -y neutron-server python-neutronclient neutron-plugin-ml2 neutron-plugin-openvswitch-agent neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent

echo -e "»\n»Removing useless Neutron SQLite database\n»"

sudo rm -f /var/lib/neutron/neutron.sqlite
