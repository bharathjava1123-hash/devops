#!bin/bash

USER=$(id -u)

echo "user : $USER"

if [ $USER -nq 0 ]
  then
    echo "run script with root permissions"
    exit 1
fi