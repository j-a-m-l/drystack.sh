# Values for installing and configuring OpenStack

# Admin configuration and credentials
DRY_ADMIN_DOMAIN='default'
DRY_ADMIN_PROJECT='admin'
DRY_ADMIN_EMAIL='admin@example.net'
DRY_ADMIN_USER='admin'
DRY_ADMIN_PASS='admin'

# This project contains a unique user for each service
DRY_SERVICE_PROJECT='service'

# Configuration options for all services TODO remove
DRY_REGION='RegionOne'

# Some clients has problems without this
export LC_ALL=C

# IP of the unique node (localhost is enough)
DRY_IP='127.0.0.1'

export OS_REGION_NAME=$DRY_REGION

export OS_PROJECT_DOMAIN_ID=$DRY_ADMIN_DOMAIN
export OS_USER_DOMAIN_ID=$DRY_ADMIN_DOMAIN

# export OS_DOMAIN_NAME=$DRY_ADMIN_DOMAIN
# export OS_DEFAULT_DOMAIN=$DRY_ADMIN_DOMAIN

export OS_PROJECT_NAME=$DRY_ADMIN_PROJECT
# export OS_TENANT_NAME=$DRY_ADMIN_PROJECT

export OS_USERNAME=$DRY_ADMIN_USER
export OS_PASSWORD=$DRY_ADMIN_PASS
export OS_AUTH_URL="http://$DRY_IP:35357/v3"

export OS_IDENTITY_API_VERSION='3'
export OS_IMAGE_API_VERSION='2'

# FIXME why is not valid?
# export OS_VOLUME_API_VERSION='2'
# export OS_VOLUME_API_VERSION='1'
