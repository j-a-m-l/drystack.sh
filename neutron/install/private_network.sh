source $PWD/configuration.sh

echo -e "»\n» Create the Private (internal) network\n»"

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    net-create $NEUTRON_PRIVATE_NET

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    subnet-create --name $NEUTRON_PRIVATE_SUBNET_NAME \
    --enable-dhcp \
    --gateway $NEUTRON_PRIVATE_SUBNET_GATEWAY \
    $NEUTRON_PRIVATE_NET $NEUTRON_PRIVATE_SUBNET_CIDR
