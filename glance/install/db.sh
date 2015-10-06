source $PWD/configuration.sh

echo -e "»\n» Creating the Glance database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE glance;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' IDENTIFIED BY '$GLANCE_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' IDENTIFIED BY '$GLANCE_DB_PASS';"
