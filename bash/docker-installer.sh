echo "=============================================================================="
echo ">> Uninstall all conflicting packages.."
echo "=============================================================================="
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
echo

echo "=============================================================================="
echo ">> Update the apt package index and install packages.."
echo "=============================================================================="
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg
echo


echo "=============================================================================="
echo ">> Add Docker’s official GPG key.."
#echo "=============================================================================="
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg


echo "=============================================================================="
echo ">> Set up the repository.."
echo "=============================================================================="
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
echo

echo "=============================================================================="
echo ">> Installing Docker Engine.."
echo "=============================================================================="
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo docker run hello-world

echo "=============================================================================="
echo ">> Docker already installed.."
echo "=============================================================================="