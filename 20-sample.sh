#!/bin/bash

DAYS=${1:-14}

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime $DAYS)

if [ -z "$FILES" ] #true if FILES is empty
then
    echo "$DAYS days Log files are $FILES"
else
    echo "No files older than $DAYS"
fi