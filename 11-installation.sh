#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "run script with root user"
if

dnf install mysql -y