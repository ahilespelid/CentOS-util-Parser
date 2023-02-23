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

    #mysql -uroot nowhenati -e "UPDATE comics_artists SET count_comics=1;    UPDATE comics_artists s SET s.count_comics =    (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>='${MAX_ID}' AND post_id<='${PROC_COUNT}' AND FIND_IN_SET(s.title, d.persons));"
    #mysql -uroot nowhenati -e "UPDATE comics_categories SET count_comics=1; UPDATE comics_categories s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>='${MAX_ID}' AND post_id<='${PROC_COUNT}' AND FIND_IN_SET(s.title, d.cats));"
    #mysql -uroot nowhenati -e "UPDATE comics_characters SET count_comics=1; UPDATE comics_characters s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>='${MAX_ID}' AND post_id<='${PROC_COUNT}' AND FIND_IN_SET(s.title, d.autors));"
    #mysql -uroot nowhenati -e "UPDATE comics_groups SET count_comics=1;     UPDATE comics_groups s SET s.count_comics =     (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>='${MAX_ID}' AND post_id<='${PROC_COUNT}' AND FIND_IN_SET(s.title, d.groups));"
    #mysql -uroot nowhenati -e "UPDATE comics_languages SET count_comics=1;  UPDATE comics_languages s SET s.count_comics =  (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>='${MAX_ID}' AND post_id<='${PROC_COUNT}' AND FIND_IN_SET(s.title, d.langs));"
    #mysql -uroot nowhenati -e "UPDATE comics_parodies SET count_comics=1;   UPDATE comics_parodies s SET s.count_comics =   (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>='${MAX_ID}' AND post_id<='${PROC_COUNT}' AND FIND_IN_SET(s.title, d.seria));"
    #mysql -uroot nowhenati -e "UPDATE comics_tags SET count_comics=1;       UPDATE comics_tags s SET s.count_comics =       (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>='${MAX_ID}' AND post_id<='${PROC_COUNT}' AND FIND_IN_SET(s.title, d.tags));"

    #mysql -uroot nowhenati -e "UPDATE comics_artists SET count_comics=1;    UPDATE comics_artists s SET s.count_comics =    (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.persons REGEXP CONCAT('[[:<:]]', s.title, '[[:>:]]'));"
    #mysql -uroot nowhenati -e "UPDATE comics_categories SET count_comics=1; UPDATE comics_categories s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.cats REGEXP CONCAT('[[:<:]]', s.title, '[[:>:]]'));"
    #mysql -uroot nowhenati -e "UPDATE comics_characters SET count_comics=1; UPDATE comics_characters s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.autors REGEXP CONCAT('[[:<:]]', s.title, '[[:>:]]'));"
    #mysql -uroot nowhenati -e "UPDATE comics_groups SET count_comics=1;     UPDATE comics_groups s SET s.count_comics =     (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.groups REGEXP CONCAT('[[:<:]]', s.title, '[[:>:]]'));"
    #mysql -uroot nowhenati -e "UPDATE comics_languages SET count_comics=1;  UPDATE comics_languages s SET s.count_comics =  (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.langs REGEXP CONCAT('[[:<:]]', s.title, '[[:>:]]'));"
    #mysql -uroot nowhenati -e "UPDATE comics_parodies SET count_comics=1;   UPDATE comics_parodies s SET s.count_comics =   (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.seria REGEXP CONCAT('[[:<:]]', s.title, '[[:>:]]'));"
    #mysql -uroot nowhenati -e "UPDATE comics_tags SET count_comics=1;       UPDATE comics_tags s SET s.count_comics =       (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.tags REGEXP CONCAT('[[:<:]]', s.title, '[[:>:]]'));"
    
    mysql -uroot nowhenati -e "UPDATE comics_artists SET count_comics=1;    UPDATE comics_artists s SET s.count_comics =    (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.persons LIKE CONCAT('%',s.title,'%'));"
    mysql -uroot nowhenati -e "UPDATE comics_categories SET count_comics=1; UPDATE comics_categories s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.cats LIKE CONCAT('%',s.title,'%'));"
    mysql -uroot nowhenati -e "UPDATE comics_characters SET count_comics=1; UPDATE comics_characters s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.autors LIKE CONCAT('%',s.title,'%'));"
    mysql -uroot nowhenati -e "UPDATE comics_groups SET count_comics=1;     UPDATE comics_groups s SET s.count_comics =     (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.groups LIKE CONCAT('%',s.title,'%'));"
    mysql -uroot nowhenati -e "UPDATE comics_languages SET count_comics=1;  UPDATE comics_languages s SET s.count_comics =  (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.langs LIKE CONCAT('%',s.title,'%'));"
    mysql -uroot nowhenati -e "UPDATE comics_parodies SET count_comics=1;   UPDATE comics_parodies s SET s.count_comics =   (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.seria LIKE CONCAT('%',s.title,'%'));"
    mysql -uroot nowhenati -e "UPDATE comics_tags SET count_comics=1;       UPDATE comics_tags s SET s.count_comics =       (SELECT COUNT(d.id) FROM parser_data d WHERE post_id>'${MAX_ID}' AND post_id<='${PROC_COUNT}' AND d.tags LIKE CONCAT('%',s.title,'%'));"

for ((i = ${MAX_ID}; i <= ${PROC_COUNT}; i++)){

     bash ~/parsershell/comics_vs_artists.sh -u ${i}    | tee -a ~/parsershell/_vs.log 
     bash ~/parsershell/comics_vs_categories.sh -u ${i} | tee -a ~/parsershell/_vs.log
     bash ~/parsershell/comics_vs_characters.sh -u ${i} | tee -a ~/parsershell/_vs.log
     bash ~/parsershell/comics_vs_groups.sh -u ${i}     | tee -a ~/parsershell/_vs.log
     bash ~/parsershell/comics_vs_languages.sh -u ${i}  | tee -a ~/parsershell/_vs.log
     bash ~/parsershell/comics_vs_parodies.sh -u ${i}   | tee -a ~/parsershell/_vs.log
     bash ~/parsershell/comics_vs_tags.sh -u ${i}       | tee -a ~/parsershell/_vs.log

    sleep 0.1
}
<< 'MULTILINE-COMMENT'
MULTILINE-COMMENT

echo 0;