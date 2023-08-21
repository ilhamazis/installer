echo "=============================================================================="
echo ">> Set up the repository key.."
#echo "=============================================================================="
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "=============================================================================="
echo ">> Installing Java.."
echo "=============================================================================="
    sudo apt-get update -y
    sudo apt install openjdk-17-jre -y
echo

echo "=============================================================================="
echo ">> Installing Jenkins.."
echo "=============================================================================="
    sudo apt-get install jenkins -y
echo

echo "=============================================================================="
echo ">> Jenkins Status"
echo "=============================================================================="  
    sudo systemctl start jenkins
    sudo systemctl status jenkins --no-pager
echo

#Variable
MYIP="$(ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}')"

echo "=============================================================================="
echo ">> Jenkins already installed.."
echo "=============================================================================="
echo "Visit http://$MYIP:8080/ and input administrator password to setup your installation."