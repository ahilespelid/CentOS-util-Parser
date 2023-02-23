#!/bin/sh
# Parer RUN

procCount(){
    ps -aux | grep "parser:run" | grep -iv "grep" | grep -iv "screen" | wc -l
}

cpuLoadProcent(){
    ps -eo pid,ppid,%mem,%cpu,comm --sort=-%cpu | grep "mysqld$" | awk '{print $4}'
}

PROC_COUNT=30
PROC=`procCount`
for ((i = 0; i <= ${PROC_COUNT}; i++)){
    if (( $PROC > $PROC_COUNT ))
    then
        exit 0;        
    fi
    screen -LdmS pars_proc${i} /opt/php73/bin/php /var/www/nowhent/data/www/last-prod.nowhentai.com/artisan parser:run &
    sleep 5;
}

echo "Count parser processes: "; procCount;
echo "CPU loaded: %"; cpuLoadProcent;
exit 0;
