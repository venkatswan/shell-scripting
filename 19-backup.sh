#!/bin/bash

SOURCE_DIR=$1
BACKUP_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days.
DATE=$(date +%Y-%m-%d-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE:: $N sudo sh $0 <source> <backup> <days(optional)>"
    exit 1
}

if [ $# -lt 2 ]
then 
    USAGE 
fi

if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR Directory $R Doesn't Exist $N"
fi

if [ -d $BACKUP_DIR ]
then
    echo -e "$BACKUP_DIR Directory $R Doesn't Exist $N"
fi

