source $PWD/configuration.sh

echo -e "»\n»Creating the Network service\n»"

__os__ service create \
    --name neutron \
    --description "OpenStack Network Service" \
    network
