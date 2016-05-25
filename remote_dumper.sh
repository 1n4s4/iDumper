#!/bin/bash

# Intro
echo "This script will be sent to the device and will dump sensitive data from it"

# Enter remote login credentials
echo "Enter username : "
read D_user
echo "Enter IP address : "
read D_IP

# Send script to remote device
scp dumper.sh $D_user@$D_IP:~

# ssh to the device and start the script
ssh $D_user@$D_IP
./dumper.sh

