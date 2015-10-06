source $PWD/configuration.sh

echo -e "»\n» Saving the Neutron configuration to the database\n»"

sudo neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head
