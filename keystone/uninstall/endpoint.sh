source $PWD/configuration.sh

echo -e "»\n» Deleting the Keystone endpoint\n»"

# FIXME
openstack endpoint delete \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	identity
