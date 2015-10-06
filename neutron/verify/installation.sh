source $PWD/configuration.sh

echo -e "»\n» List of Neutron extensions\n»"

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    ext-list

echo -e "»\n» List of Neutron agents\n»"

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    agent-list
