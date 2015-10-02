# Values for installing and configuring OpenStack, and also for using it

export LC_ALL=C

export OS_IP='127.0.0.1'

export OS_ADMIN_PROJECT='admin'
export OS_ADMIN_EMAIL='admin@example.net'
export OS_ADMIN_USER='admin'
export OS_ADMIN_PASS='admin'

# This project contains a unique user for each service
export OS_SERVICE_PROJECT='service'

# Use admin as default user user
# export OS_USERNAME=$OS_ADMIN_USER
# export OS_PASSWORD=$OS_ADMIN_PASS

# Default tenant
# export OS_TENANT_NAME=$OS_ADMIN_TENANT

# Default project
# export OS_PROJECT_NAME=$OS_ADMIN_TENANT

# Used for internalurl and publicurl 
# export OS_SERVICE_ENDPOINT="http://$OS_IP:5000/v2.0"
