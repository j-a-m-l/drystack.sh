source $PWD/configuration.sh

echo -e "»\n» Deleting the admin project\n»"

openstack project delete $DRY_ADMIN_PROJECT

echo -e "»\n» Deleting the service project\n»"

openstack project delete service
