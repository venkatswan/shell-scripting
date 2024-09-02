#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR Exists"
else    
    echo "$SOURCE_DIR Doesn't Exists"
fi