source $PWD/configuration.sh

echo -e "»\n»Creating the admin project\n»"

keystone tenant-create --name=$OS_ADMIN_PROJECT --description="Admin Project"
keystone user-create --name=$OS_ADMIN_USER --pass=$OS_ADMIN_PASS --email=$OS_ADMIN_EMAIL
keystone role-create --name=admin
keystone user-role-add --user=$OS_ADMIN_USER --tenant=$OS_ADMIN_PROJECT --role=admin

echo -e "»\n»Creating the service project\n»"

keystone tenant-create --name=$OS_SERVICE_PROJECT --description="Service Project"
