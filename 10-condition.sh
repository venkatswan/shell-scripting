#!/bin/bash

echo "Enter a Number : "
read  NUMBER

if( $NUMBER % 2 -eq 0)
then
    echo "Number is even"
else 
    echo "number is odd"
fi