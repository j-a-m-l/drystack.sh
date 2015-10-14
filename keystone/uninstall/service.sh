source $PWD/configuration.sh

echo -e "»\n» Deleting the Keystone service\n»"

openstack service delete \
		--os-url $DRY_TEMPORAL_URL \
		--os-token $DRY_TEMPORAL_TOKEN \
		identity
