source $PWD/configuration.sh

echo -e "»\n»Installing Cinder packages\n»"

sudo apt-get install -y cinder-api cinder-scheduler python-cinderclient qemu lvm2 cinder-volume
sudo apt-get install -y open-iscsi-utils open-iscsi iscsitarget sysfsutils

echo -e "»\n»Removing useless Cinder SQLite database\n»"

sudo rm -f /var/lib/cinder/cinder.sqlite
