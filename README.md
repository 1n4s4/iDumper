# iDumper
Shell script that 'collects' sensitive information from the system (iOS)

# Install:
- The target device has to be jailbroken, with openssh and keychain_dumper installed on it.
- The script uses ssh and scp to connect and transfer data between pc/mac and the device.

# Usage:
- Run 'dumper.sh' in the target device, it will automatically dump all the credentials and databases to a temporary folder, when done, it will ask you for username and password of your computer to send the dumped data to it.
- The script will delete itself and the temporary folder at the end of the script.

# Warning:
- This script is meant for learning purpose, not for stealing other people's data! 
- Use it at your own risk.

# Note:
- This script was written and tested for iOS 8, not tested nor run on iOS 9
