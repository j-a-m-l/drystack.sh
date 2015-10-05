source $PWD/configuration.sh

echo -e "»\n» Deleting the Nova user, service and endpoint\n»"

openstack user delete nova
openstack service delete nova
# TODO works, but triggers error
openstack endpoint delete `openstack endpoint list | grep nova | awk '{ print $2 }' | head -n1`

echo -e "»\n» Stopping Nova services\n»"

sudo service nova-api stop
sudo service nova-cert stop
sudo service nova-consoleauth stop
sudo service nova-scheduler stop
sudo service nova-conductor stop
sudo service nova-novncproxy stop
sudo service nova-compute stop

echo -e "»\n» Deleting the Nova database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS nova;"

# TODO 
echo -e "»\n» Removing the Nova configuration\n»"

# TODO optional
echo -e "»\n» Uninstalling the Nova packages\n»"
