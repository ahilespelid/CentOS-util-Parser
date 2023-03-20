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
echo "START ANALIZ AND POSTING ID: $MAX_ID";
if [ -z $PROC_COUNT ]
then 
    echo "How mutch processes?"
    read PROC_COUNT
fi
echo "STOP ANALIZ AND POSTING ID: $PROC_COUNT"; cat /dev/null > ~/parsershell/_ap.log
    
    bash ~/parsershell/_check.sh -m ${MAX_ID} -p ${PROC_COUNT}
    bash ~/parsershell/_vs.sh -m ${MAX_ID} -p ${PROC_COUNT}
    bash ~/parsershell/_posting.sh -m ${MAX_ID} -p ${PROC_COUNT} -v ${VIEW} -s ${SLEEP}
    mysql -uroot nowhenati -e "UPDATE comics_artists s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=1 AND d.post_id<=${PROC_COUNT} AND (d.autors LIKE CONCAT('%',s.title,'%') OR d.autors LIKE CONCAT('%, ',s.title,'') OR d.autors LIKE CONCAT('',s.title,'')) AND (SELECT is_active FROM comics c WHERE d.post_id=c.url_id)=1);"
    echo "UPDATE COUNT COMMICS : comics_artists"
    mysql -uroot nowhenati -e "UPDATE comics_categories s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=1 AND d.post_id<=${PROC_COUNT} AND (d.cats LIKE CONCAT('%',s.title,'%') OR d.cats LIKE CONCAT('%, ',s.title,'') OR d.cats LIKE CONCAT('',s.title,'')) AND (SELECT is_active FROM comics c WHERE d.post_id=c.url_id)=1);"
    echo "UPDATE COUNT COMMICS : comics_categories"
    mysql -uroot nowhenati -e "UPDATE comics_characters s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=1 AND d.post_id<=${PROC_COUNT} AND (d.characters LIKE CONCAT('%',s.title,'%') OR d.characters LIKE CONCAT('%, ',s.title,'') OR d.characters LIKE CONCAT('',s.title,'')) AND (SELECT is_active FROM comics c WHERE d.post_id=c.url_id)=1);"
    echo "UPDATE COUNT COMMICS : comics_characters"
    mysql -uroot nowhenati -e "UPDATE comics_groups s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=1 AND d.post_id<=${PROC_COUNT} AND (d.groups LIKE CONCAT('%',s.title,'%') OR d.groups LIKE CONCAT('%, ',s.title,'') OR d.groups LIKE CONCAT('',s.title,'')) AND (SELECT is_active FROM comics c WHERE d.post_id=c.url_id)=1);"
    echo "UPDATE COUNT COMMICS : comics_groups"
    mysql -uroot nowhenati -e "UPDATE comics_languages s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=1 AND d.post_id<=${PROC_COUNT} AND (d.langs LIKE CONCAT('%',s.title,'%') OR d.langs LIKE CONCAT('%, ',s.title,'') OR d.langs LIKE CONCAT('',s.title,'')) AND (SELECT is_active FROM comics c WHERE d.post_id=c.url_id)=1);"
    echo "UPDATE COUNT COMMICS : comics_languages"
    mysql -uroot nowhenati -e "UPDATE comics_parodies s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=1 AND d.post_id<=${PROC_COUNT} AND (d.seria LIKE CONCAT('%',s.title,'%') OR d.seria LIKE CONCAT('%, ',s.title,'') OR d.seria LIKE CONCAT('',s.title,'')) AND (SELECT is_active FROM comics c WHERE d.post_id=c.url_id)=1);"
    echo "UPDATE COUNT COMMICS : comics_parodies"
    mysql -uroot nowhenati -e "UPDATE comics_tags s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=1 AND d.post_id<=${PROC_COUNT} AND (d.tags LIKE CONCAT('%',s.title,'%') OR d.tags LIKE CONCAT('%, ',s.title,'') OR d.tags LIKE CONCAT('',s.title,'')) AND (SELECT is_active FROM comics c WHERE d.post_id=c.url_id)=1);"
    echo "UPDATE COUNT COMMICS : comics_tags"

<< 'MULTILINE-COMMENT'
MULTILINE-COMMENT

/opt/php73/bin/php /var/www/nowhent/data/www/last-prod.nowhentai.com/artisan cache:clear;
exit 0;