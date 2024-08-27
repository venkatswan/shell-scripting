#!/bin/bash

NUMBER=$1

if[ $NUMBER % 2 -eq 0 ]
then
    echo "Number is even"
else 
    echo "number is odd"
fi