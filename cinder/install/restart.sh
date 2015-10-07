source $PWD/configuration.sh

echo -e " »\n»Restarting Cinder services\n»"

sudo service tgt restart

sudo service cinder-api restart
sudo service cinder-scheduler restart
sudo service cinder-volume restart
