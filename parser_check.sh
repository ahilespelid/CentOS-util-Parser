#!/bin/sh
# Parer RUN
#clear;
 
i=0; num=0
mysql -uroot -e "SELECT COUNT(*) as 'All bad check' FROM nowhenati.parser_check WHERE status=2 AND code<>404;"
for var in $(mysql -uroot -e "SELECT *, 'awk' as awk FROM nowhenati.parser_check WHERE status=2 AND code<>404;" | awk -F awk '{ print $1 }' | tail -n+2)
do
    n=$((i%14)); #echo -e " $var - $n ";

    if [[ 0 -eq $n ]] 
    then 
        id=$var
    fi
    if [[ 3 -eq $n ]] 
    then 
        url=$var
    fi
    if [[ 4 -eq $n ]] 
    then 
        code=$var
    fi
    if [[ 12 -eq $n ]] 
    then 
        status=$var
    fi
    if [[ 13 -eq $n ]] 
    then 
        process=$var
    fi
    
    if [[ 13 -eq $n ]] 
    then 
        num=$((num+1)); #sleep 2

        echo -e "\n #$num ID $id : $url $code $status $process";
        echo "Read code on the 404? click Y|N "
        read -n1 k
        if [[ Y -eq $k ]] 
        then
            sql='UPDATE nowhenati.parser_check SET code=404, status=2, process=0 WHERE id='$id;           
        else
            sql='UPDATE nowhenati.parser_check SET status=0, process=0 WHERE id='$id;          
        fi 
        
        mysql -uroot -e "$sql"; echo " id $id;" 

    fi

    i=$((i+1))
done
echo 0;
