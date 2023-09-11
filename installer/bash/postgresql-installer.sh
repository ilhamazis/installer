#!/bin/bash

# Install PostgreSQL
echo "=============================================================================="
echo ">> Update System"
echo "=============================================================================="
    sudo apt update -y
    sudo apt upgrade -y

echo "=============================================================================="
echo ">> Install PostgreSQL"
echo "=============================================================================="

    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null
    sudo apt update -y
    sudo apt-get -y install postgresql postgresql-contrib

# Start and enable PostgreSQL service
    sudo systemctl start postgresql
    sudo systemctl enable postgresql
    systemctl status postgresql --no-pager
echo