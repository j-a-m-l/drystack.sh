source $PWD/configuration.sh

echo -e "»\n» Creating the Glance user\n»"

__os__ user create \
    --password $GLANCE_PASS \
    glance 

echo -e "»\n» Adding the admin role to the Glance user\n»"

__os__ role add \
    --user glance \
    --project $DRY_SERVICE_PROJECT \
    admin
