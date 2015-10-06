source $PWD/configuration.sh

echo -e "»\n»Creating the Neutron database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE neutron;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' IDENTIFIED BY '$NEUTRON_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' IDENTIFIED BY '$NEUTRON_DB_PASS';"
