source $PWD/configuration.sh

echo -e "»\n» Manual step!\n»"
echo -e "»\n»Configuring the Horizon options\n»"
echo -e "»\n» Edit '/etc/openstack-dashboard/local_settings.py' with something like:\n»"
echo -e "
OPENSTACK_HOST = '$DRY_HOST'
	
ALLOWED_HOSTS = '*'
	
CACHES = {
	'default': {
		'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
		'LOCATION': '127.0.0.1:11211',
	}
}

Comment out any other session storage configuration.
	
OPENSTACK_KEYSTONE_DEFAULT_ROLE = 'admin'
	
TIME_ZONE = 'UTC'
"

sudo service apache2 reload
