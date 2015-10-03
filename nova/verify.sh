source $PWD/configuration.sh

echo -e "»\n» List of Nova services\n»"

openstack compute service list

echo -e "»\n» List of Nova endpoints\n»"

nova endpoints

echo -e "»\n» List of images that can be used by Nova\n»"

nova image-list
