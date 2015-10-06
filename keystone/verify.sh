source $PWD/configuration.sh

echo -e "»\n» Testing token issue\n»"

openstack --os-auth-type password \
	--os-auth-url $DRY_AUTH_URL \
	--os-project-name $DRY_ADMIN_PROJECT \
	--os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
	token issue

echo -e "»\n» Testing project list\n»"

openstack --os-auth-type password \
	--os-auth-url $DRY_AUTH_URL \
	--os-project-name $DRY_ADMIN_PROJECT \
	--os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
	project list

echo -e "»\n» Testing user list\n»"

openstack --os-auth-type password \
	--os-auth-url $DRY_AUTH_URL \
	--os-project-name $DRY_ADMIN_PROJECT \
	--os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
	user list

echo -e "»\n» Testing role list\n»"

openstack --os-auth-type password \
	--os-auth-url $DRY_AUTH_URL \
	--os-project-name $DRY_ADMIN_PROJECT \
	--os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
  role list

# TODO test more things
