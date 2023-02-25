#!/bin/sh
# Parer RUN
#clear;

while getopts v:d: option
do 
    case "${option}"
        in
        v)FLAG=v;;
        d)FLAG=d;;
    esac
done

if [[ 'd' == $FLAG ]] 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_artists; ALTER TABLE comics_artists AUTO_INCREMENT=1; DELETE FROM comics_categories; ALTER TABLE comics_categories AUTO_INCREMENT=1; DELETE FROM comics_characters; ALTER TABLE comics_characters AUTO_INCREMENT=1; DELETE FROM comics_groups; ALTER TABLE comics_groups AUTO_INCREMENT=1; DELETE FROM comics_languages; ALTER TABLE comics_languages AUTO_INCREMENT=1; DELETE FROM comics_parodies; ALTER TABLE comics_parodies AUTO_INCREMENT=1; DELETE FROM comics_tags; ALTER TABLE comics_tags AUTO_INCREMENT=1;"
    echo "CLEAR DATA_VS TABLES"
    exit 0;
fi
if [[ 'v' == $FLAG ]] 
then
    mysql -uroot nowhenati -e "DELETE FROM comics_vs_artist; ALTER TABLE comics_vs_artist AUTO_INCREMENT=1; DELETE FROM comics_vs_category; ALTER TABLE comics_vs_category AUTO_INCREMENT=1; DELETE FROM comics_vs_character; ALTER TABLE comics_vs_character AUTO_INCREMENT=1; DELETE FROM comics_vs_group; ALTER TABLE comics_vs_group AUTO_INCREMENT=1; DELETE FROM comics_vs_language; ALTER TABLE comics_vs_language AUTO_INCREMENT=1; DELETE FROM comics_vs_parody; ALTER TABLE comics_vs_parody AUTO_INCREMENT=1; DELETE FROM comics_vs_tag; ALTER TABLE comics_vs_tag AUTO_INCREMENT=1;"
    echo "CLEAR VS TABLES"
    exit 0;
fi
echo "CLEAR DATA_VS AMD VS TABLES"
mysql -uroot nowhenati -e "DELETE FROM comics_artists; ALTER TABLE comics_artists AUTO_INCREMENT=1; DELETE FROM comics_categories; ALTER TABLE comics_categories AUTO_INCREMENT=1; DELETE FROM comics_characters; ALTER TABLE comics_characters AUTO_INCREMENT=1; DELETE FROM comics_groups; ALTER TABLE comics_groups AUTO_INCREMENT=1; DELETE FROM comics_languages; ALTER TABLE comics_languages AUTO_INCREMENT=1; DELETE FROM comics_parodies; ALTER TABLE comics_parodies AUTO_INCREMENT=1; DELETE FROM comics_tags; ALTER TABLE comics_tags AUTO_INCREMENT=1;"
mysql -uroot nowhenati -e "DELETE FROM comics_vs_artist; ALTER TABLE comics_vs_artist AUTO_INCREMENT=1; DELETE FROM comics_vs_category; ALTER TABLE comics_vs_category AUTO_INCREMENT=1; DELETE FROM comics_vs_character; ALTER TABLE comics_vs_character AUTO_INCREMENT=1; DELETE FROM comics_vs_group; ALTER TABLE comics_vs_group AUTO_INCREMENT=1; DELETE FROM comics_vs_language; ALTER TABLE comics_vs_language AUTO_INCREMENT=1; DELETE FROM comics_vs_parody; ALTER TABLE comics_vs_parody AUTO_INCREMENT=1; DELETE FROM comics_vs_tag; ALTER TABLE comics_vs_tag AUTO_INCREMENT=1;"
/opt/php73/bin/php /var/www/nowhent/data/www/last-prod.nowhentai.com/artisan cache:clear

<< 'MULTILINE-COMMENT'
MULTILINE-COMMENT

echo 0;