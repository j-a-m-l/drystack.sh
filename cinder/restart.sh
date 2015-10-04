source $PWD/configuration.sh

echo -e "»\n»Removing useless Cinder SQLite database\n»"

sudo rm -f /var/lib/cinder/cinder.sqlite

echo -e "»\n»Restarting Cinder and saving the configuration to the database\n»"

sudo cinder-manage db sync

sudo service tgt restart

sudo service cinder-api restart
sudo service cinder-scheduler restart
sudo service cinder-volume restart
