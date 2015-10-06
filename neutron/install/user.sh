source $PWD/configuration.sh

echo -e "»\n»Creating the Neutron user\n»"

__os__ user create \
    --password $NEUTRON_PASS \
    neutron

__os__ role add \
    --user neutron \
    --project $DRY_SERVICE_PROJECT \
    admin
