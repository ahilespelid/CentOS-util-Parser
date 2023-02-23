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

if [[ 'NULL' == $MAX_ID ]] 
then
    MAX_ID=1
else
    MAX_ID=$((MAX_ID+1))
fi
echo "Max comics_id in comics_vs_group: $MAX_ID";
if [ -z $PROC_COUNT ]
then 
    echo "How mutch processes?"
    read PROC_COUNT
fi
echo "Stop comics_id for process: $PROC_COUNT";


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

<< 'MULTILINE-COMMENT'
MULTILINE-COMMENT

echo 0;