source $PWD/configuration.sh

echo -e "»\n» Create the Public (external) network\n»"

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    net-create \
    --router:external \
    --provider:physical_network $NEUTRON_FLAT_NET \
    --provider:network_type flat \
    $NEUTRON_PUBLIC_NET

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    subnet-create --name $NEUTRON_PUBLIC_SUBNET_NAME \
    --allocation_pool "start=$NEUTRON_FLOATING_IP_START,end=$NEUTRON_FLOATING_IP_END" \
    --disable-dhcp \
    --gateway $DRY_EX_GATEWAY \
    $NEUTRON_PUBLIC_NET $NEUTRON_PUBLIC_SUBNET_CIDR
