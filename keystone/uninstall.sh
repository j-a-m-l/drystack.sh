source $PWD/configuration.sh

# TODO It seems like this is not necessary
# echo -e "»\n» Enabling the temporary authentication token mechanism\n»"

# sudo crudini --set /etc/keystone/keystone-paste.ini pipeline:public_api admin_token_auth
# sudo crudini --set /etc/keystone/keystone-paste.ini pipeline:admin_api admin_token_auth
# sudo crudini --set /etc/keystone/keystone-paste.ini pipeline:api_v3 admin_token_auth

echo -e "»\n» Removing the Apache configuration\n»"

# TODO
# sudo rm 

# TODO
echo -e "»\n» Deleting the Keystone user, service and endpoint\n»"

openstack user delete $DRY_ADMIN_USER

openstack project delete $DRY_ADMIN_PROJECT
openstack project delete service

openstack service delete keystone

openstack endpoint delete keystone

echo -e "»\n» Stopping Keystone services\n»"

sudo service keystone stop
sudo service apache2 stop

echo -e "»\n» Deleting the Keystone database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS keystone;"
