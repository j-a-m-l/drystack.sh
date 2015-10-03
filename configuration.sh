source $PWD/admin-openrc.sh

# Options for installing and configuring OpenStack

# User
HOST='machine'
USER='single'
PASSWORD='forever-alone'

# MariaDB
ROOT_DB_PASS='My&Maria'
DB_IP=$DRY_IP

# RabbitMQ
RABBIT_USER='openstack'
RABBIT_PASS='carrot'

# Useful during installation
DRY_VERBOSE='True'

# Configuration options for all services
DRY_REGION='RegionOne'

# Keystone
KEYSTONE_DB_PASS='yeah-keystone-lol'
# Use your host
KEYSTONE_SERVER_NAME='controller'
KEYSTONE_INTERNAL_URL="http://$DRYIP:5000/v2.0"
KEYSTONE_PUBLIC_URL="http://$DRY_IP:5000/v2.0"
KEYSTONE_ADMIN_URL=$OS_AUTH_URL

# Glance
GLANCE_DB_PASS='glande-jajaja'
GLANCE_PASS=$GLANCE_DB_PASS
GLANCE_ENDPOINT="http://$DRY_IP:9292"
GLANCE_EXAMPLE_IMAGE_FILE='trusty-server-cloudimg-amd64-disk1.img'
GLANCE_EXAMPLE_IMAGE_URL="http://cloud-images.ubuntu.com/trusty/current/$GLANCE_EXAMPLE_IMAGE_FILE"
