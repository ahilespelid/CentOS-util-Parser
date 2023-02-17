#!/bin/sh
# Create Many TO Many comics vs character

while [ -n "$1" ]
do
case "$1" in
--process) PROC_COUNT="$2" 
    break ;;
-p) PROC_COUNT="$2"
    break ;;
-u) mysql -uroot nowhenati -e "INSERT INTO comics_vs_character (comics_id, character_id) SELECT b.comics_id, a.id AS character_id FROM (SELECT c.id AS comics_id, (SELECT seria FROM parser_data p WHERE p.post_id=url_id) AS persons FROM comics c WHERE c.id=${2}) AS b INNER JOIN comics_characters a ON b.persons REGEXP CONCAT('[[:<:]]', a.title, '[[:>:]]');"
    echo "CREATE LINK CHARACTERS FROM comics_id: ${2} "
    exit 0;;
*) echo "$1 is not an option"
    shift 
    break ;;
esac
done

maxComicsID(){
    mysql -uroot nowhenati -e "SELECT MAX(comics_id) as id FROM comics_vs_character;";
} 
MAX_ID=`maxComicsID | awk -F id '{print $1}' | tr -d '\r\n'` 
if [ NULL == $MAX_ID ] 
then
    MAX_ID=1
else
    MAX_ID=$((MAX_ID+1))
fi
echo "Max comics_id in comics_vs_character: $MAX_ID";
if [ -z $PROC_COUNT ]
then 
    echo "How mutch processes?"
    read PROC_COUNT
fi
echo "Stop comics_id for process: $PROC_COUNT";

for ((i = ${MAX_ID}; i <= ${PROC_COUNT}; i++)){
    mysql -uroot nowhenati -e "INSERT INTO comics_vs_character (comics_id, character_id) SELECT b.comics_id, a.id AS character_id FROM (SELECT c.id AS comics_id, (SELECT seria FROM parser_data p WHERE p.post_id=url_id) AS persons FROM comics c WHERE c.id=${i}) AS b INNER JOIN comics_characters a ON b.persons REGEXP CONCAT('[[:<:]]', a.title, '[[:>:]]');"
    echo "CREATE LINK CHARACTERS FROM comics_id: ${i} "
    sleep 1
}

<< 'MULTILINE-COMMENT'
MULTILINE-COMMENT

exit 0;