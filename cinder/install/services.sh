source $PWD/configuration.sh

echo -e "»\n» Creating the Block Storage services\n»"

__os__ service create \
	--name cinder \
	--description "OpenStack Block Storage Service (v1)" \
	volume

__os__ service create \
	--name cinderv2 \
	--description "OpenStack Block Storage Service (v2)" \
	volumev2
