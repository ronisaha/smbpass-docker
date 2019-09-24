#!/usr/bin/env bash

DOMAIN_NAME=$1
username=$2

echo "Welcome to Reset Password for a Active Directory User"

echo
if [ -z "${DOMAIN_NAME}" ]; then
  read -p 'Enter Domain: ' DOMAIN_NAME
fi
if [ -z "${username}" ]; then
  read -p 'Username: ' username
fi

read -sp "Enter currennt password of user $username@$DOMAIN_NAME: " password

if [[ -z ${DOMAIN_NAME} || -z ${username} || -z ${password} ]]; then
  echo
  echo
  echo "ERROR: Invalid argument specified"
  exit 1
fi

pass1='Secret*123'
pass2='Secret%321'

echo

echo -e "$password\n$pass1\n$pass1" | (smbpasswd -s  -U $username -r $DOMAIN_NAME)
echo -e "$pass1\n$pass2\n$pass2" | (smbpasswd -s  -U $username -r $DOMAIN_NAME)
echo -e "$pass2\n$password\n$password" | (smbpasswd -s  -U $username -r $DOMAIN_NAME)

