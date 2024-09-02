#!/bin/bash

DAYS=${1:-14}

FILES=$(find /home/ec2-user/logs -name "*.log" -mtime $DAYS)

echo "$DAYS days Log files are $FILES"


# if [ -z "$FILES" ] #true if FILES is empty
# then
#     echo "$DAYS days Log files are $FILES"
# else
#     echo "No files older than $DAYS"
# fi