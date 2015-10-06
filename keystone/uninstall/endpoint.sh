source $PWD/configuration.sh

echo -e "»\n» Deleting the Keystone endpoint\n»"

openstack endpoint delete keystone
