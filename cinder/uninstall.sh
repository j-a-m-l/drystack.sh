source $PWD/configuration.sh

echo -e "»\n» Stopping Cinder services\n»"

# sudo service tgt restart

sudo service cinder-api stop
sudo service cinder-scheduler stop
sudo service cinder-volume stop

echo -e "»\n» Deleting the Cinder user, service and endpoint\n»"

__os__ user delete cinder
__os__ service delete cinder
# TODO works, but triggers error
__os__ endpoint delete `openstack endpoint list | grep cinder | awk '{ print $2 }' | head -n1`

echo -e "»\n» Deleting the Cinder database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS cinder;"

# TODO 
echo -e "»\n» Removing the Cinder configuration\n»"

# TODO optional
echo -e "»\n» Uninstalling the Cinder packages\n»"
