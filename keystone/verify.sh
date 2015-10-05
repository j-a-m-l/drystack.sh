source $PWD/configuration.sh

echo -e "»\n» Disabling the temporary authentication token mechanism\n»"

sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:public_api admin_token_auth
sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:admin_api admin_token_auth
sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:api_v3 admin_token_auth

echo -e "»\n» Checking ...\n»"

openstack --os-auth-url $OS_AUTH_URL \
	--os-auth-type password \
	--os-project-name $DRY_ADMIN_PROJECT \
	--os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
	token issue

openstack --os-auth-url $OS_AUTH_URL \
	--os-auth-type password \
	--os-project-name $DRY_ADMIN_PROJECT \
	--os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
	project list

openstack --os-auth-url $OS_AUTH_URL \
	--os-auth-type password \
	--os-project-name $DRY_ADMIN_PROJECT \
	--os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
	user list

openstack --os-auth-url $OS_AUTH_URL \
	--os-auth-type password \
  --os-project-name $DRY_ADMIN_PROJECT \
  --os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
  role list

# TODO test more things
