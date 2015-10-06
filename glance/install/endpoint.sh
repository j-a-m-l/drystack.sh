source $PWD/configuration.sh

echo -e "»\n» Creating the Image endpoint\n»"

__os__ endpoint create \
    --publicurl $GLANCE_ENDPOINT \
    --internalurl $GLANCE_ENDPOINT \
    --adminurl $GLANCE_ENDPOINT \
    --region $DRY_REGION \
    image
