source $PWD/configuration.sh

echo -e "»\n» Creating the Glance user\n»"

openstack user create \
	--password $GLANCE_PASS \
	glance 

openstack role add \
	--user glance \
	--project service \
	admin

echo -e "»\n» Creating the Image service\n»"

openstack service create \
	--name glance \
	--description "OpenStack Image Service" \
	image

echo -e "»\n» Creating the Image endpoint\n»"

openstack endpoint create \
	--publicurl $GLANCE_ENDPOINT \
	--internalurl $GLANCE_ENDPOINT \
	--adminurl $GLANCE_ENDPOINT \
	--region $OS_REGION_NAME \
	image
