source $PWD/configuration.sh

echo -e "»\n»Creating the Cinder database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE cinder;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'localhost' IDENTIFIED BY '$CINDER_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'%' IDENTIFIED BY '$CINDER_DB_PASS';"

echo -e "»\n»Creating the Cinder user\n»"

openstack user create --password $CINDER_PASS cinder
openstack role add --user cinder --project service admin

echo -e "»\n»Creating the Block Storage services\n»"

openstack service create \
	--name cinder \
	--description "OpenStack Block Storage Service (v1)" \
	volume

openstack service create \
	--name cinderv2 \
	--description "OpenStack Block Storage Service (v2)" \
	volumev2

echo -e "»\n»Creating the Block Storage endpoints\n»"

openstack endpoint create \
	--publicurl $CINDER_ENDPOINT \
	--internalurl $CINDER_ENDPOINT \
	--adminurl $CINDER_ENDPOINT \
	--region $DRY_REGION \
	volume

# It's the same than ^
openstack endpoint create \
	--publicurl $CINDER_ENDPOINT \
	--internalurl $CINDER_ENDPOINT \
	--adminurl $CINDER_ENDPOINT \
	--region $DRY_REGION \
	volumev2

echo -e "»\n»Installing Cinder packages\n»"

sudo apt-get install cinder-api cinder-scheduler cinder-volume qemu lvm2 open-iscsi-utils open-iscsi iscsitarget sysfsutils
