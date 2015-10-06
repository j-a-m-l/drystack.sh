source $PWD/configuration.sh

echo -e "»\n» Creating the admin project\n»"

openstack project create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--description "Admin Project" \
	$DRY_ADMIN_PROJECT 

echo -e "»\n» Creating the service project\n»"

openstack project create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--description "Service Project" \
	$DRY_SERVICE_PROJECT
