#!/bin/sh
# Parer RUN
#clear;

while getopts p:m:v:s: option
do 
    case "${option}"
        in
        p)PROC_COUNT=${OPTARG};;
        m)MAX_ID=${OPTARG};;
        v)VIEW=${OPTARG};;
        s)SLEEP=${OPTARG};;
    esac
done

if [[ -z $MAX_ID ]] 
then
    MAX_ID=1
fi
if [[ -z $VIEW ]] 
then
    VIEW=1
fi
if [[ -z $SLEEP ]] 
then
    SLEEP=0
fi
echo "START POSTING ID: $MAX_ID";
if [ -z $PROC_COUNT ]
then 
    echo "How mutch processes?"
    read PROC_COUNT
fi
echo "STOP POSTING ID: $PROC_COUNT"; cat /dev/null > ~/parsershell/_posting.log

COUNT=$((PROC_COUNT - MAX_ID))
#echo "SELECT DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL $COUNT MINUTE ) as T FROM DUAL; | tail -n2 | awk -F 'T' '{print $1}' | xargs"
MINUTA=`mysql -uroot nowhenati -e "SELECT DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL $COUNT MINUTE ) as T FROM DUAL;" | tail -n2 | awk -F 'T' '{print $1}' | xargs`

echo "TIME START POSTING : ${MINUTA} "
INTERVAL=1
for ((i = ${MAX_ID}; i <= ${PROC_COUNT}; i++)){
    #mysql -uroot nowhenati -e "UPDATE comics SET is_active=${VIEW}, created_at=(SELECT DATE_ADD('${MINUTA}', INTERVAL ${INTERVAL} MINUTE) as T FROM DUAL) WHERE id=${i};"
    mysql -uroot nowhenati -e "UPDATE comics SET is_active=${VIEW}, created_at=CURRENT_TIMESTAMP() WHERE id=${i};"
    echo "POSTING ID : ${i} is_active=${VIEW}"
    
    wget --no-check-certificate -q -O - https://nowhentai.com/gallery/${i} | grep "img" | egrep -no "src=\"(.*)(jpeg|png|webp)\""
    
    sleep ${SLEEP}
}
<< 'MULTILINE-COMMENT'
MULTILINE-COMMENT

/opt/php73/bin/php /var/www/nowhent/data/www/last-prod.nowhentai.com/artisan cache:clear;
exit 0;