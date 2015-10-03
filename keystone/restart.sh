source $PWD/configuration.sh

echo -e "»\n»Disabling the Keystone automatic start\n»"

# TODO ensure this
echo "manual" | sudo tee /etc/init/keystone.override

echo -e "»\n»Removing useless Keystone SQLite database\n»"

sudo rm -f /var/lib/keystone/keystone.db

echo -e "»\n»Restarting Keystone and saving the configuration to the database\n»"

sudo keystone-manage db_sync

sudo service keystone restart
