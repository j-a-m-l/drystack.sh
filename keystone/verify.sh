source $PWD/configuration.sh

echo -e "»\n»Disabling the temporary authentication token mechanism\n»"

sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:public_api admin_token_auth
sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:admin_api admin_token_auth
sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:api_v3 admin_token_auth

unset OS_SERVICE_TOKEN OS_SERVICE_ENDPOINT

openstack --os-auth-url $OS_AUTH_URL \
	--os-auth-type password \
  --os-project-name $OS_ADMIN_PROJECT \
  --os-username $OS_ADMIN_USER \
	--os-password $OS_ADMIN_PASS \
  token issue

# TODO test more things
