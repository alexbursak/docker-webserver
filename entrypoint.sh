#!/bin/bash

# PHP
service php7.4-fpm start

# Apache2
service apache2 restart

service php7.4-fpm status
service apache2 status
service cron status

#exec "$@"
/bin/bash