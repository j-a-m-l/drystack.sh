source $PWD/configuration.sh

echo -e "»\n» Creating the Network endpoint\n»"

__os__ endpoint create \
    --publicurl $NEUTRON_ENDPOINT \
    --internalurl $NEUTRON_ENDPOINT \
    --adminurl $NEUTRON_ENDPOINT \
    --region $DRY_REGION \
    network
