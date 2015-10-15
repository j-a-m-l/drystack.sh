source $PWD/configuration.sh

echo -e "»\n» Creating Cinder volume types\n»"

__os__ volume type create regular
__os__ volume type set regular --property volume_backend_name=volumes-hdd

__os__ volume type create performance
__os__ volume type set performance --property volume_backend_name=volumes-ssd
