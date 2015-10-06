source $PWD/configuration.sh

echo -e "»\n» Deleting the Keystone user\n»"

openstack user delete $DRY_ADMIN_USER
