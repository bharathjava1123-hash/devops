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
   if [ $? -ne 0 ]
     then
      echo "Git installation not success, Please check it..."
      exit 1
     else
      echo "Git installation success"
   fi
 else 
   echo "Git is already installed, nothing to do it.."
fi   


dnf list installed mysql

if [ $? -ne 0 ] 
 then
  echo "mysql is not installed, going to install it.."
  dnf install mysql-server -y
   if [ $? -ne 0 ]
     then
      echo "mysql installation not success, Please check it..."
      exit 1
     else 
      echo "mysql installation success"
   fi
 else 
  echo "mysql is already installed, nothing to do it..."
fi