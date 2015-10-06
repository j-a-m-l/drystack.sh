source $PWD/configuration.sh

echo -e "»\n» Create the 'open' security group\n»"

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    security-group-create open --description "Open all things!"

echo -e "»\n» Add rules to the 'open' security group\n»"

nova --os-auth-url $DRY_AUTH_URL \
    --os-project-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    secgroup-add-rule open icmp -1 -1 0.0.0.0/0

nova --os-auth-url $DRY_AUTH_URL \
    --os-project-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    secgroup-add-rule open tcp 22 22 0.0.0.0/0

nova --os-auth-url $DRY_AUTH_URL \
    --os-project-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    secgroup-add-rule open tcp 80 80 0.0.0.0/0

nova --os-auth-url $DRY_AUTH_URL \
    --os-project-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    secgroup-add-rule open tcp 443 443 0.0.0.0/0

# NOTE uses 'os-tenant-name' instead of 'os-project-name'
neutron --os-auth-url $DRY_AUTH_URL \
    --os-tenant-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    security-group-show open
