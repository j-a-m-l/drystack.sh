source $PWD/configuration.sh

echo -e "»\n» Downloading an example image\n»"

mkdir /tmp/images
wget -P /tmp/images $GLANCE_EXAMPLE_IMAGE_URL

echo -e "»\n» Creating the example image\n»"

__os__ image create \
    --file "/tmp/images/$GLANCE_EXAMPLE_IMAGE_FILE" \
    --disk-format qcow2 \
    --container-format bare \
    --public \
    "$GLANCE_EXAMPLE_IMAGE_NAME"

echo -e "»\n» Listing all images\n»"

__os__ image list

echo -e "»\n» Removing the example image\n»"

rm -r /tmp/images
