#!bin/bash

USER=$(id -u)

LOGS_FOLDER=/var/log/shell-script
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

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
      echo -e "$2 is $R FAILED $N , Please check it..." | tee -a $LOG_FILE
      exit 1
     else
      echo -e "$2 is $G success $N " | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh loop-installation.sh package1 package2 ..."
    exit 1
}

if [ $# -ne 0 ]
  then
    USAGE
fi


echo "Script started executing at: $(date)" | tee -a $LOG_FILE

for package in $@
do
dnf list installed $package | tee -a $LOG_FILE
if [ $? -ne  0 ] 
 then
  echo "Git is not installed, going to install it.." | tee -a $LOG_FILE
  dnf install $package -y | tee -a $LOG_FILE
  VALIDATE $? "git installion"
 else 
   echo -e "Git is already $Y installed, nothing to do it.. $N" | tee -a $LOG_FILE
fi   
done
