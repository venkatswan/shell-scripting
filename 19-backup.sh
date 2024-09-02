#!/bin/bash

SOURCE_DIR=$1
BACKUP_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days.
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
ZIP_FILE=$BACKUP_DIR/app-logs-$TIME_STAMP.zip

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

if [ ! -z $FILES ] #true if FILES is empty, ! nakes it expression false
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    #check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zippped files older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "No log files older than $DAYS"
fi