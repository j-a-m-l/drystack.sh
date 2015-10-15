source $PWD/configuration.sh

echo -e "»\n» Creating the Cinder database\n»"

mysql -uroot -p$ROOT_DB_PASS -e "CREATE DATABASE cinder;"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'localhost' IDENTIFIED BY '$CINDER_DB_PASS';"

mysql -uroot -p$ROOT_DB_PASS -e "GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'%' IDENTIFIED BY '$CINDER_DB_PASS';"
