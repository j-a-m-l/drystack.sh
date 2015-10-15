source $PWD/configuration.sh

echo -e "»\n» Creating the Compute endpoint\n»"

# For some reason, Nova seems to require creating the endpoints differently than other services

__os__ endpoint create \
	--region $DRY_REGION \
	compute public $NOVA_ENDPOINT

__os__ endpoint create \
	--region $DRY_REGION \
	compute internal $NOVA_ENDPOINT

__os__ endpoint create \
    --region $DRY_REGION \
    compute admin $NOVA_ENDPOINT
