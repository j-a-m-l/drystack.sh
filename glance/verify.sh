source $PWD/configuration.sh

echo -e "»\n» Downloading an example image\n»"

mkdir /tmp/images
wget -P /tmp/images $GLANCE_EXAMPLE_IMAGE_URL

echo -e "»\n» Creating the example image\n»"

glance image-create \
	--file "/tmp/images/$GLANCE_EXAMPLE_IMAGE_FILE" \
	--visibility public \
	--disk-format qcow2 \
	--container-format bare \
	--name 'Ubuntu 14.04 3 - Cloud Image' \
	--progress

echo -e "»\n» List of Glance images\n»"

openstack image list

echo -e "»\n» Removing the example image\n»"

rm -r /tmp/images
