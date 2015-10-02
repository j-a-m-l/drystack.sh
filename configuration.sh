source $PWD/environment.sh

# Options for installing and configuring OpenStack

# User
export HOST='machine'
export USER='single'
export PASSWORD='forever-alone'

# MariaDB
export ROOT_DB_PASS='My&Maria'
export DB_IP=$OS_IP

# RabbitMQ
export RABBIT_USER='openstack'
export RABBIT_PASS='carrot'

# URL of the OpenStack authorization
export OS_AUTH_URL="http://$OS_IP:35357/v2.0"
# Authentication token for all services
export OS_SERVICE_TOKEN='ADMIN_TOKEN'
export OS_SERVICE_ENDPOINT=$OS_AUTH_URL

# Configuration options for all services
export OS_VERBOSE='False'
export OS_REGION='RegionOne'

# Keystone
export KEYSTONE_DB_PASS='yeah-keystone-lol'
# Use your host
export KEYSTONE_SERVER_NAME='controller'
export KEYSTONE_INTERNAL_URL="http://$OS_IP:5000/v2.0"
export KEYSTONE_PUBLIC_URL="http://$OS_IP:5000/v2.0"
