source $PWD/configuration.sh

echo -e "»\n» Create the router that connects the networks\n»"

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    router-create $NEUTRON_ROUTER

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    router-interface-add $NEUTRON_ROUTER $NEUTRON_PRIVATE_SUBNET_NAME

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    router-gateway-set $NEUTRON_ROUTER $NEUTRON_PUBLIC_NET
