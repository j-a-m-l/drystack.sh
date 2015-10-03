source $PWD/configuration.sh

echo -e "»\n» Creating the Glance database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE glance;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' IDENTIFIED BY '$GLANCE_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' IDENTIFIED BY '$GLANCE_DB_PASS';"

echo -e "»\n» Creating the Glance user\n»"

keystone user-create --name=glance --pass=$GLANCE_PASS
keystone user-role-add --user=glance --tenant=service --role=admin

echo -e "»\n» Creating the Image service\n»"

keystone service-create \
	--name=glance \
	--type=image \
	--description="OpenStack Image Service"

echo -e "»\n» Creating the Image endpoint\n»"

keystone endpoint-create \
	--service=glance \
	--publicurl=$GLANCE_ENDPOINT \
	--internalurl=$GLANCE_ENDPOINT \
	--adminurl=$GLANCE_ENDPOINT \
	--region=$DRY_REGION

echo -e "»\n» Installing Glance packages\n»"

sudo apt-get install -y glance
