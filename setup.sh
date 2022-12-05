#!/bin/bash

if [ -d "backend" ]
then
    echo "Directory backend exists."
    read -p "Would you like to remove backend directory?(Y/N): " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        rm -rf backend/
        mkdir backend
    fi
else
    echo "Creating directory backend"
    mkdir backend
fi

cd backend
git init

git submodule add --force git@bitbucket.org:viweon/smc.git
git submodule add --force git@bitbucket.org:viweon/smrt.git
git submodule add --force git@bitbucket.org:viweon/cdm.git
git submodule add --force git@bitbucket.org:viweon/platform.git
# ###########################################################
git submodule add --force git@bitbucket.org:viweon/bdm.git
git submodule add --force git@bitbucket.org:viweon/retail.git
git submodule add --force git@bitbucket.org:viweon/testing.git
# ###########################################################
sudo apt update
sudo apt install -y jq
jq -n '{"folders": [{"path": "smrt"},{"path": "smc"},{"path": "retail"},{"path": "platform"},{"path": "testing"},{"path": "cdm"},{"path": "bdm"}],"settings": {}}' > retail.code-workspace