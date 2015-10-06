source $PWD/configuration.sh

# Stop Apache for setting the temporal authentication
# sudo service apache2 stop

# NOTE OS_URL requires /v2.0
# export OS_URL="http://$DRY_IP:35357/v2.0"
# export OS_TOKEN=$DRY_TEMPORAL_TOKEN

# sudo service apache2 start

echo -e "»\n»Creating the admin project\n»"

openstack project create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--description "Admin Project" \
	$DRY_ADMIN_PROJECT 

openstack user create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--password $DRY_ADMIN_PASS \
	--email $DRY_ADMIN_EMAIL \
	$DRY_ADMIN_USER 

openstack role create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	admin

openstack role add \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--user $DRY_ADMIN_USER \
	--project $DRY_ADMIN_PROJECT \
	admin

echo -e "»\n»Creating the service project\n»"

openstack project create \
	--os-url $DRY_TEMPORAL_URL \
	--os-token $DRY_TEMPORAL_TOKEN \
	--description "Service Project" \
	service

# unset OS_TOKEN OS_URL
