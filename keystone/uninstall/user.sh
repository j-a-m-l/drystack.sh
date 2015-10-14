source $PWD/configuration.sh

echo -e "»\n» Deleting the Keystone user\n»"

openstack user delete \
		--os-url $DRY_TEMPORAL_URL \
		--os-token $DRY_TEMPORAL_TOKEN \
		$DRY_ADMIN_USER 

echo -e "»\n» Deleting the admin role\n»"

openstack role delete \
		--os-url $DRY_TEMPORAL_URL \
		--os-token $DRY_TEMPORAL_TOKEN \
		admin
