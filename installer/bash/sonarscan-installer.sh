#!/bin/bash

cd /tmp || exit
echo "Downloading sonar-scanner....."
if [ -d "/tmp/sonar-scanner-cli-5.0.1.3006-linux.zip" ];then
    sudo rm /tmp/sonar-scanner-cli-5.0.1.3006-linux.zip
fi
wget -q https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip
echo "Download completed."

echo "Unziping downloaded file..."
unzip sonar-scanner-cli-5.0.1.3006-linux.zip
echo "Unzip completed."
rm sonar-scanner-cli-5.0.1.3006-linux.zip

echo "Installing to opt..."
if [ -d "/var/opt/sonar-scanner-5.0.1.3006-linux" ];then
    sudo rm -rf /var/opt/sonar-scanner-5.0.1.3006-linux
fi
sudo mv sonar-scanner-5.0.1.3006-linux /var/opt

echo "Creating links"
ln -s /var/opt/sonar-scanner-5.0.1.3006-linux/bin/sonar-scanner /usr/local/bin/

echo "path sonar-scanner: "
which sonar-scanner

echo "Installation completed successfully."

echo "You can use sonar-scanner!"


