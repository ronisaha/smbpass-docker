#!/usr/bin/env bash

DOMAIN_NAME=$1
username=$2

echo "Welcome to Change Password for a Active Directory User"

echo
if [ -z "${DOMAIN_NAME}" ]; then
  read -p 'Enter Domain: ' DOMAIN_NAME
fi
if [ -z "${username}" ]; then
  read -p 'Username: ' username
fi

read -sp "Enter currennt password of user $username@$DOMAIN_NAME: " cpassword
echo
read -sp "Enter New password: " password

if [[ -z ${DOMAIN_NAME} || -z ${username} || -z ${cpassword} || -z ${password} ]]; then
  echo
  echo
  echo "ERROR: Invalid argument specified"
  exit 1
fi

echo

echo -e "$cpassword\n$password\n$password" | (smbpasswd -s  -U $username -r $DOMAIN_NAME)

