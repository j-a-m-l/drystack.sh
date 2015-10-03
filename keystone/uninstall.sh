# TODO
echo -e "»\n» Deleting the Keystone user, service and endpoint\n»"

echo -e "»\n» Deleting the Keystone database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "DROP DATABASE IF EXISTS keystone;"
