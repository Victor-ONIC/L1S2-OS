#!/bin/bash

is_int() {
    local re="^[0-9]+$"
    if [[ $1 =~ $re ]]; then
        echo 1
    else
        echo 0
    fi
}

get_number() {
    local re="^[A-Za-z]+\.[0-9]+\.tar\.gz$"
    local base=$(basename $1)
    if [[ $base =~ $re ]]; then
        echo $(echo $base | cut -f2 -d".")
    else
        echo -1
    fi        
}

get_max_number() {
    local max=0
    for i in $(find ./logs -name $1.*.tar.gz -type f); do
        local n=$(get_number $i)
        if [ $n -gt $max ] && [ $n -ne -1 ]; then
            max=$n
        fi
    done
    echo $max
}

rotation_log() {
    local j
    for i in $(seq $(get_max_number $1) -1 0); do
        let "j=$i+1"
        name=logs/$1.$i.tar.gz
        if [ -f $name ]; then
            mv logs/$1.$i.tar.gz logs/$1.$j.tar.gz
        fi
    done
    tar zcf ./logs/$1.0.tar.gz ./logs/$1
    rm -f ./logs/$1
    touch ./logs/$1
}

rotation_log log
