#!/bin/sh
# Parer RUN
#clear;

if [[ '-c' == $1 ]] 
then
    echo "CLEAR THUMBS : /hdd/nowhentai";
    find /hdd/nowhentai -name "thumb" -type d  -exec rm -rf {} \;
    /opt/php73/bin/php /var/www/nowhent/data/www/last-prod.nowhentai.com/artisan cache:clear;
    exit 0;
fi
echo "LIST THUMBS : /hdd/nowhentai";
find /hdd/nowhentai -name "thumb" -type d -print

exit 0;