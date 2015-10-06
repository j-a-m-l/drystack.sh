source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Keystone paste configuration\n»"

sudo mkdir -p $PWD/keystone/backup
sudo cp /etc/keystone/keystone-paste.ini $PWD/keystone/backup/

echo -e "»\n» Disabling the temporary authentication token mechanism\n»"

sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:public_api admin_token_auth
sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:admin_api admin_token_auth
sudo crudini --del /etc/keystone/keystone-paste.ini pipeline:api_v3 admin_token_auth
