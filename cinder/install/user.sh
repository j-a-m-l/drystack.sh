source $PWD/configuration.sh

echo -e "»\n»Creating the Cinder user\n»"

__os__ user create \
	--password $CINDER_PASS \
	cinder

__os__ role add \
	--user cinder \
	--project $DRY_SERVICE_PROJECT \
	admin
