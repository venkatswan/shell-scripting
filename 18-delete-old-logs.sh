#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR Directory $G Available $N"
else    
    echo -e "$SOURCE_DIR Directory $R Not Available $N"
fi