#! bin/bash

for i in `find $1 -iname "*[éèêëàÉÈÊËÀ]*" -type f`
do
    n=`echo $i | sed "y/éèêëàÉÈÊËÀ/eeeeaEEEEA/"`
    mv $i $n
done
