source $PWD/configuration.sh

echo -e "»\n» Creating the Nova user\n»"

__os__ user create \
    --password $NOVA_PASS \
    nova

__os__ role add \
    --user nova \
    --project $DRY_SERVICE_PROJECT \
    admin
