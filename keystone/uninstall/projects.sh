source $PWD/configuration.sh

echo -e "»\n» Deleting the admin project\n»"

openstack project delete \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	$DRY_ADMIN_PROJECT 

echo -e "»\n» Deleting the service project\n»"

openstack project delete \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	$DRY_SERVICE_PROJECT
