#!/bin/bash

DAY1=${1:-14}
DAY2=+$DAY1

FILES=$(find /home/ec2-user/logs -name "*.log" -mtime $DAY2)

echo "$DAY2 days Log files are $FILES"

