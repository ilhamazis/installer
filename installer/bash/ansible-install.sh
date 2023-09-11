#!/bin/bash

echo "=============================================================================="
echo ">> Show ubuntu system.."
echo "=============================================================================="
    hostnamectl
echo

echo "=============================================================================="
echo ">> Update the apt package.."
echo "=============================================================================="
    sudo apt-get update -y
echo

echo "=============================================================================="
echo ">> Installing the latest pip from the Python Packaging Authority (PPA)"
echo "=============================================================================="
    sudo apt-add-repository ppa:ansible/ansible

echo "=============================================================================="
echo ">> Installing Ansible & Upgrading.."
echo "=============================================================================="
    sudo apt install ansible
    sudo apt upgrade ansible
echo

echo "=============================================================================="
echo ">> Show Ansible Version"
echo "=============================================================================="
    ansible --version
echo

echo "=============================================================================="
echo ">> Ansible already installed."
echo "=============================================================================="
