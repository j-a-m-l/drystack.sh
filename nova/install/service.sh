source $PWD/configuration.sh

echo -e "»\n» Creating the Compute service\n»"

__os__ service create \
    --name nova \
    --description "OpenStack Compute Service" \
    compute
