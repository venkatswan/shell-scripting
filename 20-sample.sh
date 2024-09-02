#!/bin/bash

DAY1=${1:-14}

FILES=$(find /home/ec2-user/logs -name "*.log" -mtime +$DAY1)

echo "$DAY1 days old Log files are $FILES"

