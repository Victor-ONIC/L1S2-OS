#! bin/bash

number1=`ls $1 | wc -l`
number2=`ls $2 | wc -l`

if [ $number1 -gt $number2 ]
then 
    echo $1
else
    echo $2
fi
