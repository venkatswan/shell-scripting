#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$Y Please Run Script with ROOR USER....$N"
        exit 1  # Exit 1 means fail and stop executing script
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R FAILED $N check it"
        exit 1
    else
        echo -e "$2 is $G SUCCESS $N"
    fi
}

CHECK_ROOT

for package in $@  # $@ refers to all arguments passed to it
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo "MYSQL is not installed, going to install now..."
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else    
        echo "$package is already installed, Nothing to do..."
    fi
done