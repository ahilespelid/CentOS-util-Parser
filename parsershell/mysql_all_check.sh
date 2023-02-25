#!/bin/sh
# Parer RUN
#clear;

while getopts t:p:m: option
do 
    case "${option}"
        in
        t)TABLE=${OPTARG};;
        p)PROC_COUNT=${OPTARG};;
        m)MAX_ID=${OPTARG};;
    esac
done
echo "TABLE : $TABLE";
if [[ -z $MAX_ID ]] 
then
    MAX_ID=1
fi
echo "Start id : $MAX_ID";
if [ -z $PROC_COUNT ]
then 
    echo "How mutch processes?"
    read PROC_COUNT
fi
echo "Stop id: $PROC_COUNT";

if [[ 'comics_artists' == $TABLE ]]; 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_artists; ALTER TABLE comics_artists AUTO_INCREMENT=1;";
    mysql -uroot nowhenati -e "INSERT INTO comics_artists (title,alias) SELECT DISTINCT repl AS title, REPLACE(repl,' ','-') AS alias FROM (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(parser_data.autors, ',', numbers.n), ',', -1)) repl FROM ( SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19  UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29  UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39  UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49  UNION ALL SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59  UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69  UNION ALL SELECT 70 UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79  UNION ALL SELECT 80 UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89  UNION ALL SELECT 90 UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95 UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99  UNION ALL SELECT 100) numbers INNER JOIN parser_data ON CHAR_LENGTH(parser_data.tags)-CHAR_LENGTH(REPLACE(parser_data.tags, ',', ''))>=numbers.n-1 WHERE parser_data.post_id>=${MAX_ID} AND parser_data.post_id<=${PROC_COUNT}) dd WHERE repl IS NOT NULL;"
    mysql -uroot nowhenati -e "UPDATE comics_artists s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=${MAX_ID}  AND d.post_id<=${PROC_COUNT} AND (d.autors LIKE CONCAT('%',s.title,'%') OR d.autors LIKE CONCAT('%, ',s.title,'') OR d.autors LIKE CONCAT('',s.title,'')));"
fi
if [[ 'comics_categories' == $TABLE ]]; 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_categories; ALTER TABLE comics_categories AUTO_INCREMENT=1;";
    mysql -uroot nowhenati -e "INSERT INTO comics_categories (title,alias) SELECT DISTINCT repl AS title, REPLACE(repl,' ','-') AS alias FROM (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(parser_data.cats, ',', numbers.n), ',', -1)) repl FROM ( SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19  UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29  UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39  UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49  UNION ALL SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59  UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69  UNION ALL SELECT 70 UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79  UNION ALL SELECT 80 UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89  UNION ALL SELECT 90 UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95 UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99  UNION ALL SELECT 100) numbers INNER JOIN parser_data ON CHAR_LENGTH(parser_data.tags)-CHAR_LENGTH(REPLACE(parser_data.tags, ',', ''))>=numbers.n-1 WHERE parser_data.post_id>=${MAX_ID} AND parser_data.post_id<=${PROC_COUNT}) dd WHERE repl IS NOT NULL;"
    mysql -uroot nowhenati -e "UPDATE comics_categories s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=${MAX_ID} AND d.post_id<=${PROC_COUNT} AND (d.cats LIKE CONCAT('%',s.title,'%') OR d.cats LIKE CONCAT('%, ',s.title,'') OR d.cats LIKE CONCAT('',s.title,'')));"
fi
if [[ 'comics_characters' == $TABLE ]]; 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_characters; ALTER TABLE comics_characters AUTO_INCREMENT=1;";
    mysql -uroot nowhenati -e "INSERT INTO comics_characters (title,alias) SELECT DISTINCT repl AS title, REPLACE(repl,' ','-') AS alias FROM (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(parser_data.characters, ',', numbers.n), ',', -1)) repl FROM ( SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19  UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29  UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39  UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49  UNION ALL SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59  UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69  UNION ALL SELECT 70 UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79  UNION ALL SELECT 80 UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89  UNION ALL SELECT 90 UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95 UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99  UNION ALL SELECT 100) numbers INNER JOIN parser_data ON CHAR_LENGTH(parser_data.tags)-CHAR_LENGTH(REPLACE(parser_data.tags, ',', ''))>=numbers.n-1 WHERE parser_data.post_id>=${MAX_ID} AND parser_data.post_id<=${PROC_COUNT}) dd WHERE repl IS NOT NULL;"
    mysql -uroot nowhenati -e "UPDATE comics_characters s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=${MAX_ID} AND d.post_id<=${PROC_COUNT} AND (d.characters LIKE CONCAT('%',s.title,'%') OR d.characters LIKE CONCAT('%, ',s.title,'') OR d.characters LIKE CONCAT('',s.title,'')));"
fi
if [[ 'comics_groups' == $TABLE ]]; 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_groups; ALTER TABLE comics_groups AUTO_INCREMENT=1;";
    mysql -uroot nowhenati -e "INSERT INTO comics_groups (title,alias) SELECT DISTINCT repl AS title, REPLACE(repl,' ','-') AS alias FROM (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(parser_data.groups, ',', numbers.n), ',', -1)) repl FROM ( SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19  UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29  UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39  UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49  UNION ALL SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59  UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69  UNION ALL SELECT 70 UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79  UNION ALL SELECT 80 UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89  UNION ALL SELECT 90 UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95 UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99  UNION ALL SELECT 100) numbers INNER JOIN parser_data ON CHAR_LENGTH(parser_data.tags)-CHAR_LENGTH(REPLACE(parser_data.tags, ',', ''))>=numbers.n-1 WHERE parser_data.post_id>=${MAX_ID} AND parser_data.post_id<=${PROC_COUNT}) dd WHERE repl IS NOT NULL;"
    mysql -uroot nowhenati -e "UPDATE comics_groups s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=${MAX_ID} AND d.post_id<=${PROC_COUNT} AND (d.groups LIKE CONCAT('%',s.title,'%') OR d.groups LIKE CONCAT('%, ',s.title,'') OR d.groups LIKE CONCAT('',s.title,'')));"
fi
if [[ 'comics_languages' == $TABLE ]]; 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_languages; ALTER TABLE comics_languages AUTO_INCREMENT=1;";
    mysql -uroot nowhenati -e "INSERT INTO comics_languages (title,alias) SELECT DISTINCT repl AS title, REPLACE(repl,' ','-') AS alias FROM (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(parser_data.langs, ',', numbers.n), ',', -1)) repl FROM ( SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19  UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29  UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39  UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49  UNION ALL SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59  UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69  UNION ALL SELECT 70 UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79  UNION ALL SELECT 80 UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89  UNION ALL SELECT 90 UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95 UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99  UNION ALL SELECT 100) numbers INNER JOIN parser_data ON CHAR_LENGTH(parser_data.tags)-CHAR_LENGTH(REPLACE(parser_data.tags, ',', ''))>=numbers.n-1 WHERE parser_data.post_id>=${MAX_ID} AND parser_data.post_id<=${PROC_COUNT}) dd WHERE repl IS NOT NULL;"
    mysql -uroot nowhenati -e "UPDATE comics_languages s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=${MAX_ID} AND d.post_id<=${PROC_COUNT} AND (d.langs LIKE CONCAT('%',s.title,'%') OR d.langs LIKE CONCAT('%, ',s.title,'') OR d.langs LIKE CONCAT('',s.title,'')));"
fi
if [[ 'comics_parodies' == $TABLE ]]; 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_parodies; ALTER TABLE comics_parodies AUTO_INCREMENT=1;";
    mysql -uroot nowhenati -e "INSERT INTO comics_parodies (title,alias) SELECT DISTINCT repl AS title, REPLACE(repl,' ','-') AS alias FROM (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(parser_data.seria, ',', numbers.n), ',', -1)) repl FROM ( SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19  UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29  UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39  UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49  UNION ALL SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59  UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69  UNION ALL SELECT 70 UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79  UNION ALL SELECT 80 UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89  UNION ALL SELECT 90 UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95 UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99  UNION ALL SELECT 100) numbers INNER JOIN parser_data ON CHAR_LENGTH(parser_data.tags)-CHAR_LENGTH(REPLACE(parser_data.tags, ',', ''))>=numbers.n-1 WHERE parser_data.post_id>=${MAX_ID} AND parser_data.post_id<=${PROC_COUNT}) dd WHERE repl IS NOT NULL;"
    mysql -uroot nowhenati -e "UPDATE comics_parodies s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=${MAX_ID} AND d.post_id<=${PROC_COUNT} AND (d.seria LIKE CONCAT('%',s.title,'%') OR d.seria LIKE CONCAT('%, ',s.title,'') OR d.seria LIKE CONCAT('',s.title,'')));"
fi
if [[ 'comics_tags' == $TABLE ]]; 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_tags; ALTER TABLE comics_tags AUTO_INCREMENT=1;";
    mysql -uroot nowhenati -e "INSERT INTO comics_tags (title,alias) SELECT DISTINCT repl AS title, REPLACE(repl,' ','-') AS alias FROM (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(parser_data.tags, ',', numbers.n), ',', -1)) repl FROM ( SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19  UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29  UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39  UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49  UNION ALL SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59  UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69  UNION ALL SELECT 70 UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79  UNION ALL SELECT 80 UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89  UNION ALL SELECT 90 UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95 UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99  UNION ALL SELECT 100) numbers INNER JOIN parser_data ON CHAR_LENGTH(parser_data.tags)-CHAR_LENGTH(REPLACE(parser_data.tags, ',', ''))>=numbers.n-1 WHERE parser_data.post_id>=${MAX_ID} AND parser_data.post_id<=${PROC_COUNT}) dd WHERE repl IS NOT NULL;"
    mysql -uroot nowhenati -e "UPDATE comics_tags s SET s.count_comics = (SELECT COUNT(d.id) FROM parser_data d WHERE d.post_id>=${MAX_ID} AND d.post_id<=${PROC_COUNT} AND (d.tags LIKE CONCAT('%',s.title,'%') OR d.tags LIKE CONCAT('%, ',s.title,'') OR d.tags LIKE CONCAT('',s.title,'')));"
    #mysql -uroot nowhenati -e "UPDATE comics_tags SET count_comics=1; UPDATE comics_tags s SET s.count_comics = (SELECT COUNT(d.id) FROM comics c INNER JOIN parser_data d ON c.url_id=d.post_id WHERE c.is_active=1 AND d.tags LIKE CONCAT('%',s.title,'%'));"
fi

<< 'MULTILINE-COMMENT'
MULTILINE-COMMENT

echo 0;