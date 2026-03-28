#!bin/bash

USER=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USER -ne 0 ]
  then
    echo "Please run this script with root priveleges"
    exit 1
fi

VALIDATE(){
   if [ $1 -ne 0]
     then 
      echo -e "$2 is $R FAILED $N , Please check it..."
      exit 1
     else
      echo -e "$2 is $G success $N "
    fi
}

for package in $@
do
dnf list installed $package
if [ $? -ne  0 ] 
 then
  echo "Git is not installed, going to install it.."
  dnf install $package -y
  VALIDATE $? "git installion"
 else 
   echo "Git is already installed, nothing to do it.."
fi   
done
