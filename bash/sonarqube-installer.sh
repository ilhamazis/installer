#!/bin/bash

# Install Java JDK 11
echo "=============================================================================="
echo ">> Installing Java.."
echo "=============================================================================="
  sudo apt-get update -y
  sudo apt install openjdk-11-jdk -y
echo

# Install PostgreSQL
echo "=============================================================================="
echo ">> Installing and enable PostgreSQL"
echo "=============================================================================="
    sudo apt-get -y install postgresql postgresql-contrib

# Start and enable PostgreSQL service
    sudo systemctl start postgresql
    sudo systemctl enable postgresql
    systemctl status postgresql --no-pager
echo

# Download and install SonarQube
echo "=============================================================================="
echo ">> Download and install SonarQube"
echo "=============================================================================="
# Remove existing SonarQube files and folders if they exist
cd /tmp 
if [ -f sonarqube-9.1.0.47736.zip ]; then
    rm sonarqube-9.1.0.47736.zip
fi

if [ -d /opt/sonarqube/sonarqube-9.1.0.47736 ]; then
    sudo rm -rf /opt/sonarqube/sonarqube-9.1.0.47736
fi

# Download and extract installer file
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.1.0.47736.zip
unzip sonarqube-9.1.0.47736.zip 
sudo mv sonarqube-9.1.0.47736 /opt/sonarqube

# Prompt user for SonarQube database credentials
echo "=============================================================================="
echo ">> SonarQube Configuration"
echo "=============================================================================="
read -p "Enter PostgreSQL username for SonarQube (default: postgres): " sonar_username
sonar_username=${sonar_username:-postgres}
read -p "Enter PostgreSQL password for SonarQube: " sonar_password
echo

# Configure SonarQube
sudo sed -i "s|#sonar.jdbc.username=|sonar.jdbc.username=${sonar_username}|" /opt/sonarqube/conf/sonar.properties
sudo sed -i "s|#sonar.jdbc.password=|sonar.jdbc.password=${sonar_password}|" /opt/sonarqube/conf/sonar.properties
sudo sed -i "s|#sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube|sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube|" /opt/sonarqube/conf/sonar.properties

# Set up systemd service for SonarQube
echo "[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonarqube
Group=sonarqube
Restart=always
LimitNOFILE=65536
LimitNPROC=4096

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/sonarqube.service
echo

echo "=============================================================================="
echo ">> SonarQube Status"
echo "=============================================================================="
# Reload systemd daemon
sudo systemctl daemon-reload
# Start and enable SonarQube service
sudo systemctl start sonarqube
sudo systemctl enable sonarqube
sudo systemctl status sonarqube --no-pager
# Clean up
rm sonarqube-9.1.0.47736.zip

# Variable
MYIP="$(ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}')"
echo "=============================================================================="
echo ">> SonarQube already installed.."
echo "=============================================================================="
echo "Installation complete. Access SonarQube at http://$MYIP:9000"
echo
