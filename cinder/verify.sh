source $PWD/configuration.sh

echo -e "»\n» List of Cinder services\n»"

__os__ service show volume

__os__ service show volumev2

echo -e "»\n» Creating a test Cinder volume\n»"

# FIXME it does not set the name; maybe is related to this: https://bugs.launchpad.net/trove/+bug/1382881
__os__ volume create \
	--size 1 \
	test_volume

sleep 2

echo -e "»\n» List of Cinder volumes\n»"

__os__ volume list --all-projects

echo -e "»\n» Deleting the test Cinder volume\n»"

__os__ volume delete test_volume

echo -e "»\n» List of Cinder volume types\n»"

__os__ volume type list
