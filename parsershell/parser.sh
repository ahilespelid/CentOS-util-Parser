#!/bin/sh
# Parer RUN

procCount(){
    ps -aux | grep "parser:run" | grep -iv "grep" | grep -iv "screen" | wc -l
}

procList(){
    ps -aux | grep "parser:run" | grep -iv "grep" | grep -iv "screen"
}

clearErrParseCheckDB(){
    mysql -u root -e "UPDATE nowhenati.parser_check SET status=0 , process=0 WHERE status=2 AND code<>404";
} 
clearErrParseCheckDB

while [ -n "$1" ]
do
case "$1" in
--process) PROC_COUNT="$2" 
    break ;;
-p) PROC_COUNT="$2"
    break ;;
*) echo "$1 is not an option"
    shift 
    break ;;
esac
done

if [ -z $PROC_COUNT ]
then 
    echo "How mutch processes?"
    read PROC_COUNT
fi

for ((i = 0; i <= ${PROC_COUNT}; i++)){
    if (( $i > procCount))
    then
        screen -LdmS pars_proc${i} /opt/php73/bin/php /var/www/nowhent/data/www/last-prod.nowhentai.com/artisan parser:run &
    fi
}
procList
echo "Count processes: ";
procCount

exit 0;
