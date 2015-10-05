source $PWD/configuration.sh

echo -e "»\n» List of Cinder services\n»"

cinder service-list

echo -e "»\n» Creating a test Cinder volume\n»"

cinder create --name test_volume 1

echo -e "»\n» List of Cinder columes\n»"

cinder list

echo -e "»\n» Deleting the test Cinder volume\n»"

cinder delete test_volume

echo -e "»\n» Manual step!\n»"
echo -e "»\n» Creating Cinder volume types\n»"
# echo -e '
cinder type-create regular
cinder type-key regular set volume_backend_name=volumes-hdd

cinder type-create performance
cinder type-key regular set volume_backend_name=volumes-ssd
# '
