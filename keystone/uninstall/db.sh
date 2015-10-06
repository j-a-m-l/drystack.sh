source $PWD/configuration.sh

echo -e "»\n» Deleting the Keystone database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS keystone;"
