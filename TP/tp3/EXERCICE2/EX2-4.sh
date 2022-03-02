#! bin/bash

for i in `find $1 -iname "*.JPG" -type f`
do
    mv $i ${i%.JPG}.jpg
done
