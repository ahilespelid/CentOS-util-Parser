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

maxComicsID(){
    mysql -uroot nowhenati -e "SELECT MAX(comics_id) as id FROM comics_vs_group;";
} 
#MAX_ID=`maxComicsID | awk -F id '{print $1}' | tr -d '\r\n'` 

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

#FULL=''

for ((i = ${MAX_ID}; i <= ${PROC_COUNT}; i++)){
    FULL=`mysql -uroot nowhenati -e "SELECT url_id, '+++' as awk, (SELECT autors FROM nowhenati.parser_data WHERE post_id=c.url_id) AS  parser_data, '+++' as awk, (SELECT title FROM nowhenati.comics_characters WHERE LOCATE(title, (SELECT autors FROM nowhenati.parser_data WHERE post_id=c.url_id)) > 0 LIMIT 1) AS comics_characters FROM nowhenati.comics c WHERE c.id=${i} ORDER BY url_id ASC;" | tail -n+2`
    echo " ${i} : COMICS_CHARACTERS"
    
    URL_ID=`echo ${FULL} | awk -F '+++' '{print $1}' | xargs`; PARSER_DATA=`echo ${FULL} | awk -F '+++' '{print $2}' | xargs`; COMICS_CHARACTERS=`echo ${FULL} | awk -F '+++' '{print $3}' | xargs`
    if [[ 'NULL' == "$PARSER_DATA" ]]; 
    then
        continue
    else
        if [[ 'NULL' == "$COMICS_CHARACTERS" ]]; 
        then
            #echo " ${FULL} "               
         
            # TITLE=`echo ${PARSER_DATA} | tr "," ":"`           
            IFS=','; read -ra TITLE <<< "$PARSER_DATA"
            for j in "${TITLE[@]}"
            do
                g=`echo "$j" | xargs`
                
                mysql -uroot nowhenati -e "INSERT INTO nowhenati.comics_characters SET title='${g}', count_comics=count_comics+1 ON DUPLICATE KEY UPDATE count_comics=count_comics+1; UPDATE comics_characters SET alias = REPLACE(title, ' ', '-') WHERE title='${g}';"
                # echo "INSERT INTO nowhenati.comics_characters SET title='${g}', count_comics=count_comics+1 ON DUPLICATE KEY UPDATE count_comics=count_comics+1;"
                echo "${i} : $g ADD";
            done
        else
            echo "${i} : $COMICS_CHARACTERS EXISTS"           
        fi
        echo -e "\n";
    fi
    sleep 0.2
}

<< 'MULTILINE-COMMENT'
MULTILINE-COMMENT

echo 0;