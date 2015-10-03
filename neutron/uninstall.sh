source $PWD/configuration.sh

echo -e "»\n» Deleting the Neutron user, service and endpoint\n»"

openstack user delete neutron
openstack service delete network
# TODO works, but triggers error
openstack endpoint delete `openstack endpoint list | grep neutron | awk '{ print $2 }' | head -n1`

echo -e "»\n» Deleting the Neutron database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS neutron;"

# TODO 
echo -e "»\n» Removing the Neutron configuration\n»"

# TODO optional
echo -e "»\n» Uninstalling the Neutron packages\n»"
