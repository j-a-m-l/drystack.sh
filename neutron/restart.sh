source $PWD/configuration.sh

echo -e "»\n»Removing useless Neutron SQLite database\n»"

sudo rm -f /var/lib/neutron/neutron.sqlite

echo -e "»\n»Restarting Neutron and saving the configuration to the database\n»"

sudo neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head

sudo service openvswitch-switch restart

sudo service nova-api restart
sudo service neutron-server restart

sudo service neutron-plugin-openvswitch-agent restart
sudo service neutron-l3-agent restart
sudo service neutron-dhcp-agent restart
sudo service neutron-metadata-agent restart
