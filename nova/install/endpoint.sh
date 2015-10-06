source $PWD/configuration.sh

echo -e "»\n»Creating the Compute endpoint\n»"

__os__ endpoint create \
    --publicurl $NOVA_ENDPOINT \
    --internalurl $NOVA_ENDPOINT \
    --adminurl $NOVA_ENDPOINT \
    --region $DRY_REGION \
    compute
