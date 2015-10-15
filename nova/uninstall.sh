source $PWD/configuration.sh

# echo -e "»\n» Deleting the Nova instances\n»"

# echo -e "»\n» Deleting the Nova flavors\n»"

echo -e "»\n» Stopping Nova services\n»"

sudo service nova-api stop
sudo service nova-cert stop
sudo service nova-consoleauth stop
sudo service nova-scheduler stop
sudo service nova-conductor stop
sudo service nova-novncproxy stop
sudo service nova-compute stop

echo -e "»\n» Deleting the Nova user\n»"

__os__ user delete nova

echo -e "»\n» Deleting the Nova service\n»"

__os__ service delete nova

echo -e "»\n» Deleting the Nova endpoint\n»"

# TODO works, but triggers error
__os__ endpoint delete `openstack endpoint list | grep nova | awk '{ print $2 }' | head -n1`

echo -e "»\n» Deleting the Nova database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS nova;"

# TODO 
echo -e "»\n» Removing the Nova configuration\n»"

# TODO optional
echo -e "»\n» Uninstalling the Nova packages\n»"
