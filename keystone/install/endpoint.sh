source $PWD/configuration.sh

echo -e "»\n»Creating the Identity endpoint\n»"

openstack endpoint create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--publicurl $KEYSTONE_PUBLIC_URL \
	--internalurl $KEYSTONE_INTERNAL_URL \
	--adminurl $KEYSTONE_ADMIN_URL \
	--region $DRY_REGION \
	identity
