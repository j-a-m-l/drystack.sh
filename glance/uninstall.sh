source $PWD/configuration.sh

echo -e "»\n» Deleting the Glance user, service and endpoint\n»"

keystone user-delete glance
keystone service-delete glance
# TODO works, but triggers error
keystone endpoint-delete `keystone endpoint-list | grep 9292 | awk '{ print $2 }'`

echo -e "»\n» Deleting the Glance database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS glance;"

# TODO 
echo -e "»\n» Removing the Glance configuration\n»"

# TODO optional
echo -e "»\n» Uninstalling the Glance packages\n»"
