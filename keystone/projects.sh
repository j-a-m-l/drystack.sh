source $PWD/configuration.sh

echo -e "»\n»Creating the admin project\n»"

keystone tenant-create --name=$DRY_ADMIN_PROJECT --description="Admin Project"
keystone user-create --name=$DRY_ADMIN_USER --pass=$DRY_ADMIN_PASS --email=$DRY_ADMIN_EMAIL
keystone role-create --name=admin
keystone user-role-add --user=$DRY_ADMIN_USER --tenant=$DRY_ADMIN_PROJECT --role=admin

echo -e "»\n»Creating the service project\n»"

keystone tenant-create --name=$DRY_SERVICE_PROJECT --description="Service Project"
