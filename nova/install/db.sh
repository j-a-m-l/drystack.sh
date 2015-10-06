source $PWD/configuration.sh

echo -e "»\n»Creating the Nova database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE nova;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' IDENTIFIED BY '$NOVA_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY '$NOVA_DB_PASS';"
