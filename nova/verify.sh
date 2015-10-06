source $PWD/configuration.sh

echo -e "»\n» List of Nova services\n»"

__os__ compute service list

echo -e "»\n» List of Nova endpoints\n»"

nova --os-auth-url $DRY_AUTH_URL \
    --os-project-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    endpoints

echo -e "»\n» List of images that can be used by Nova\n»"

nova --os-auth-url $DRY_AUTH_URL \
    --os-project-name $DRY_ADMIN_PROJECT \
    --os-username $DRY_ADMIN_USER \
    --os-password $DRY_ADMIN_PASS \
    image-list
