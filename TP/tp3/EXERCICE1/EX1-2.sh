#! bin/bash

re="^[0-9]+$"

if [[ $1 =~ $re ]]
then 
    exit 1
else
    exit 0
fi
