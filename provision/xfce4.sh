#!/bin/sh
# sudo apt-get update
echo "**** Begin installing xfce"

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install xubuntu-core^
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo VBoxClient --checkhostversion
sudo VBoxClient --clipboard
sudo VBoxClient --display
sudo VBoxClient --draganddrop
sudo VBoxClient --seamless
echo "$(whoami):$(whoami)" | sudo chpasswd

echo "**** End installing xfce"
