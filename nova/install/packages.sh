source $PWD/configuration.sh

echo -e "»\n»Installing Nova packages\n»"

sudo apt-get install -y nova-api nova-cert nova-conductor nova-consoleauth nova-novncproxy nova-scheduler python-novaclient nova-compute sysfsutils

echo -e "»\n»Removing useless Nova SQLite database\n»"

sudo rm -f /var/lib/nova/nova.sqlite
