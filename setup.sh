#!/bin/bash

## Run updates
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

## Install base packages
sudo apt-get install -y cmatrix git-all wget curl htop nano gpg zsh cowsay fortune sl

## InstalL GCloud
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install -y google-cloud-cli kubectl google-cloud-cli-gke-gcloud-auth-plugin google-cloud-cli-kpt google-cloud-cli-skaffold

## Installing Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
terraform -install-autocomplete

## Install VSCode
wget -O code-latest.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install -y ./code-latest.deb
rm code-latest.deb
for ext in googlecloudtools.cloudcode ms-python.vscode-pylance vscode.json-language-features ecmel.vscode-html-css hashicorp.terraform golang.go christian-kohler.npm-intellisense leizongmin.node-module-intellisense; do code --install-extension $ext; done

## Install Node & NPM & Yarn
sudo apt-get install -y nodejs npm
sudo npm install --global yarn

## install Python
sudo apt-get install -y python3 python3-pip
pip3 install virtualenv

## Setup dev
git config --global user.name "Rick G"
git config --global user.email "a@b.com"
mkdir ~/code
echo -e "\n\n\n" | ssh-keygen -b 4096

## Configure Docker
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## Install PodMon
# sudo apt-get -y install podman


# Fin
fortune | cowsay
echo "####Dont forget to run gcloud init####"
