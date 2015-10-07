source $PWD/configuration.sh

echo -e "»\n»Creating the Block Storage endpoints\n»"

__os__ endpoint create \
	--publicurl $CINDER_ENDPOINT \
	--internalurl $CINDER_ENDPOINT \
	--adminurl $CINDER_ENDPOINT \
	--region $DRY_REGION \
	volume

# It's the same than ^
__os__ endpoint create \
	--publicurl $CINDER_ENDPOINT \
	--internalurl $CINDER_ENDPOINT \
	--adminurl $CINDER_ENDPOINT \
	--region $DRY_REGION \
	volumev2
