source $PWD/configuration.sh

echo -e "»\n» Saving the configuration to the database\n»"

sudo cinder-manage db sync
