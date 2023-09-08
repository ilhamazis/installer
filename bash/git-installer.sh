#!/bin/bash
echo "=============================================================================="
echo ">> Installing Git.."
echo "=============================================================================="
 sudo apt-get update -y
 sudo apt-get install git -y
    git --version
echo

echo "=============================================================================="
echo ">> Configure Git (input your git account)"
echo "=============================================================================="
    read -p 'Username: ' name
    read -p 'Email: ' email
echo 
    git config --global user.name $name
    git config --global user.email $email
echo "== Git config list =="
echo user.name=$name
echo user.email=$email
echo

#variable
VER="$(git --version)"

echo "=============================================================================="
echo ">> $VER already set up"
echo "=============================================================================="

