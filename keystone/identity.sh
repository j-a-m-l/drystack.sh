source $PWD/configuration.sh

# Stop Apache for setting the temporal authentication
sudo service apache2 stop

# NOTE OS_URL requires /v2.0
export OS_URL="http://$DRY_IP:35357/v2.0"
export OS_TOKEN=$DRY_TEMPORAL_TOKEN

sudo service apache2 start

echo -e "»\n»Creating the Identity service\n»"

openstack service create \
	--name keystone \
	--description "OpenStack Identity Service" \
	identity

echo -e "»\n»Creating the Identity endpoint\n»"

openstack endpoint create \
	--internalurl $KEYSTONE_INTERNAL_URL \
	--publicurl $KEYSTONE_PUBLIC_URL \
	--adminurl $KEYSTONE_ADMIN_URL \
	--region $OS_REGION_NAME \
	identity

unset OS_TOKEN OS_URL
