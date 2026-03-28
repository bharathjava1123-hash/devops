#!bin/bash

USER=$(id -u)

echo "user : $USER"

if [ $USER -ne 0 ]
  then
    echo "run script with root permissions"
    exit 1
fi