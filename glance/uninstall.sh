source $PWD/configuration.sh

echo -e "»\n» Deleting the Glance user, service and endpoint\n»"

openstack user delete glance
openstack service delete glance
# TODO works, but triggers error
openstack endpoint delete `openstack endpoint list | grep 9292 | awk '{ print $2 }'`

echo -e "»\n» Stopping Glance services\n»"

sudo service glance-registry stop
sudo service glance-api stop

echo -e "»\n» Deleting the Glance database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS glance;"

# TODO 
echo -e "»\n» Removing the Glance configuration\n»"

# TODO optional
echo -e "»\n» Uninstalling the Glance packages\n»"
