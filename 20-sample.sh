#!/bin/bash

DAYS=${1:-14}

FILES=$(find /home/ec2-user/logs -name "*.log" -mtime +10)

echo "$DAYS days Log files are $FILES"

