#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
  then
    echo "Please run this script with root priveleges"
    exit 1
fi

dnf list installed git

if [ $? -ne  0 ] 
 then
  echo "Git is not installed, going to install it.."
  dnf install git -y
 else 
   echo "Git is alreadyt installed, nothing to do it.."
fi   