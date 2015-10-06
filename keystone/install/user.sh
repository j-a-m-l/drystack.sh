source $PWD/configuration.sh

echo -e "»\n» Creating the admin user\n»"

openstack user create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--password $DRY_ADMIN_PASS \
	--email $DRY_ADMIN_EMAIL \
	$DRY_ADMIN_USER 

echo -e "»\n» Creating the admin role\n»"

openstack role create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	admin

echo -e "»\n» Add the admin role to the admin user\n»"

openstack role add \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--user $DRY_ADMIN_USER \
	--project $DRY_ADMIN_PROJECT \
	admin
