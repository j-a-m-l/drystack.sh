source $PWD/configuration.sh

echo -e "»\n» Creating the Image service\n»"

__os__ service create \
    --name glance \
    --description "OpenStack Image Service" \
    image
