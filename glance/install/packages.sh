source $PWD/configuration.sh

echo -e "»\n» Installing Glance packages\n»"

sudo apt-get install -y glance python-glanceclient

echo -e "»\n» Removing useless Glance SQLite database\n»"

sudo rm -f /var/lib/glance/glance.sqlite
