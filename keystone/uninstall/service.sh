source $PWD/configuration.sh

echo -e "»\n» Deleting the Keystone service\n»"

openstack service delete keystone
