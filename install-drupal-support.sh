#!/usr/bin/env

echo ''
echo '⚡️ Installing Drupal Support'

mkdir ~/terminus && cd ~/terminus
curl -O https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar && php installer.phar install

read -p "You need a machine token from Pantheon to continue. Press [Enter] when ready."

read machineToken

terminus auth:login --machine-token=$machineToken

echo "What is your email used for this account?"

read userEmail

terminus auth:login --email=userEmail

read -p "Did everything excute correctly " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Try troubleshooting tips at https://pantheon.io/docs/terminus/install#troubleshooting."
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi