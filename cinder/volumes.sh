source $PWD/configuration.sh

echo -e "»\n» Manual step!\n»"
echo -e "»\n» It is necessary to create the LVM volumes\n»"
echo -e '
sudo pvcreate /dev/sdb
sudo pvcreate /dev/sdc
sudo vgcreate cinder-volumes-1 /dev/sdb
sudo vgcreate cinder-volumes-2 /dev/sdc
'

echo -e "»\n» Manual step!\n»"
echo -e "»\n» It is necessary to filter which devices are visible to LVM\n»"
echo -e "»\n» Edit '/etc/lvm/lvm.conf' with something like:\n»"
echo -e '
devices {
..
	filter = [ "a/sdb/", "a/sdc/", "r/.*/" ]
	filter = [ "a|/dev/sdb/|", "a|/dev/sdc/|", "r/.*/" ]
'
echo -e "It can be tested with 'sudo vgs -vvvv'"

echo -e "»\n» Configuring additional options for Cinder volumes\n»"

sudo crudini --set /etc/cinder/cinder.conf DEFAULT state_path /var/lib/cinder
sudo crudini --set /etc/cinder/cinder.conf DEFAULT volumes_dir /var/lib/cinder/volumes
sudo crudini --set /etc/cinder/cinder.conf DEFAULT volume_name_template volume-%s
sudo crudini --set /etc/cinder/cinder.conf DEFAULT volume_group cinder-volumes

echo -e "»\n» Manual step!\n»"
echo -e "»\n» It is necessary to configure the Cinder volumes\n»"
# echo -e '
sudo crudini --set /etc/cinder/cinder.conf DEFAULT enabled_backends volumes-ssd,volumes-hdd
sudo crudini --set /etc/cinder/cinder.conf DEFAULT default_volume_type performance

sudo crudini --set /etc/cinder/cinder.conf volumes-ssd volume_driver cinder.volume.drivers.lvm.LVMVolumeDriver
sudo crudini --set /etc/cinder/cinder.conf volumes-ssd volume_group cinder-volumes-1
sudo crudini --set /etc/cinder/cinder.conf volumes-ssd volume_backend_name volumes-ssd
sudo crudini --set /etc/cinder/cinder.conf volumes-ssd iscsi_protocol iscsi
sudo crudini --set /etc/cinder/cinder.conf volumes-ssd iscsi_helper tgtadm

sudo crudini --set /etc/cinder/cinder.conf volumes-hdd volume_driver cinder.volume.drivers.lvm.LVMVolumeDriver
sudo crudini --set /etc/cinder/cinder.conf volumes-hdd volume_group cinder-volumes-2
sudo crudini --set /etc/cinder/cinder.conf volumes-hdd volume_backend_name volumes-hdd
sudo crudini --set /etc/cinder/cinder.conf volumes-hdd iscsi_protocol iscsi
sudo crudini --set /etc/cinder/cinder.conf volumes-hdd iscsi_helper tgtadm
# '
