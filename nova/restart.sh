source $PWD/configuration.sh

echo -e "»\n»Removing useless Nova SQLite database\n»"

sudo rm -f /var/lib/nova/nova.sqlite

echo -e "»\n»Restarting Nova and saving the configuration to the database\n»"

sudo nova-manage db sync

sudo service nova-api restart
sudo service nova-cert restart
sudo service nova-consoleauth restart
sudo service nova-scheduler restart
sudo service nova-conductor restart
sudo service nova-novncproxy restart
sudo service nova-compute restart
