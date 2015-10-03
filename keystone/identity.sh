source $PWD/configuration.sh

echo -e "»\n»Creating the Identity service\n»"

keystone service-create \
	--name=keystone \
	--type=identity \
	--description="Keystone Identity Service"

echo -e "»\n»Creating the Identity endpoint\n»"

keystone endpoint-create \
	--service=keystone \
	--internalurl=$KEYSTONE_INTERNAL_URL \
	--publicurl=$KEYSTONE_PUBLIC_URL \
	--adminurl=$KEYSTONE_ADMIN_URL \
	--region=$DRY_REGION
