#!/bin/bash

SOURCE_DIR=$1
BACKUP_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days.
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
ZIP_FILE=$BACKUP_DIR-app-logs-$TIME_STAMP.zip


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

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR Directory $R Doesn't Exist $N"
fi

if [ ! -d $BACKUP_DIR ]
then
    echo -e "$BACKUP_DIR Directory $R Doesn't Exist $N"
fi


FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "Files: $FILES"

if [ ! -z $FILES ]
then
    echo "old log files available"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    if[ -f $ZIP_FILE ]
    then
        echo -e " $G Zip file is created with $DAYS Log files $N"
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo "Deleting log files: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo -e " $R Zip file is not created with $N"
        exit 1    
    fi    
else
    echo -e "$R $DAYS old log files not available $N"
fi