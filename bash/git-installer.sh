echo "=============================================================="
echo ">> Installing Git.."
echo "=============================================================="
sudo apt-get update
sudo apt-get install git
git --version
echo

echo "=============================================================="
echo ">> Configure Git"
echo "=============================================================="
read -p 'Username: ' name
read -p 'Email: ' email
echo 
git config --global user.name $name
git config --global user.email $email
echo "= Git config list ="
git config --list

echo "=============================================================="
echo ">> Git already set up.."
echo "=============================================================="

