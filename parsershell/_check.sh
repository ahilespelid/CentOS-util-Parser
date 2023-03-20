#!/bin/sh
# Parer RUN
#clear;

while getopts p:m: option
do 
    case "${option}"
        in
        p)PROC_COUNT=${OPTARG};;
        m)MAX_ID=${OPTARG};;
    esac
done

if [[ -z $MAX_ID ]] 
then
    MAX_ID=1
fi
echo "START CHECK BASES: $MAX_ID";
if [ -z $PROC_COUNT ]
then 
    echo "How mutch processes?"
    read PROC_COUNT
fi
echo "STOP CHECK BASES: $PROC_COUNT"; cat /dev/null > ~/parsershell/_check.log

     bash ~/parsershell/mysql_all_check.sh -t comics_artists -m ${MAX_ID} -p ${PROC_COUNT}    | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_all_check.sh -t comics_categories -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_all_check.sh -t comics_characters -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_all_check.sh -t comics_groups -m ${MAX_ID} -p ${PROC_COUNT}     | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_all_check.sh -t comics_languages -m ${MAX_ID} -p ${PROC_COUNT}  | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_all_check.sh -t comics_parodies -m ${MAX_ID} -p ${PROC_COUNT}   | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_all_check.sh -t comics_tags -m ${MAX_ID} -p ${PROC_COUNT}       | tee -a ~/parsershell/_check.log

<< 'MULTILINE-COMMENT'
#for ((i = ${MAX_ID}; i <= ${PROC_COUNT}; i++)){
     bash ~/parsershell/mysql_artists_check.sh -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_categories_check.sh -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_characters_check.sh -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_groups_check.sh -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_languages_check.sh -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_parodies_check.sh -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log
     bash ~/parsershell/mysql_tags_check.sh -m ${MAX_ID} -p ${PROC_COUNT} | tee -a ~/parsershell/_check.log

    sleep 0.1
#}
MULTILINE-COMMENT

/opt/php73/bin/php /var/www/nowhent/data/www/last-prod.nowhentai.com/artisan cache:clear;
echo 1;
exit 0;