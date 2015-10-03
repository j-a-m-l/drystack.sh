source $PWD/configuration.sh

echo -e "»\n» Removing useless Glance SQLite database\n»"

sudo rm -f /var/lib/glance/glance.sqlite

echo -e "»\n» Restarting Glance and saving the configuration to the database\n»"

sudo glance-manage db_sync

sudo service glance-registry restart
sudo service glance-api restart
