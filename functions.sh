#!/bin/bash

function pow() {
    result=$(($1**$2))
    echo $result
}

function shortest() {
    args=($*)
    #echo ${args[*]}
    for ((i=1;i<$#;i++)); do
        for ((j=0;j<$#;j++)); do
            if ((${#args[j]}>${#args[i]})); then
                temp=${args[i]}
                args[i]=${args[j]}
                args[j]=$temp
            fi
        done
    done
    #echo ${args[*]}
    result="${args[0]}"
    for ((i=0;i<$#;i++)); do
        if ((${#args[i+1]}==${#args[0]})); then
            result="$result\n${args[i+1]}"
        fi        
    done
    echo -e $result
}

print_log() {
    result="[$(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M)] $*"
    echo $result
}