source $PWD/configuration.sh

echo -e "»\n»Creating the Identity service\n»"

openstack service create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--name keystone \
	--description "OpenStack Identity Service" \
	identity
