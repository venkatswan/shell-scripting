#!/bin/bash

DAYS=${1:-14}

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS)

echo "Log files are $FILES"