#!/bin/bash

## Run updates
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

## Install base packages
sudo apt-get install -y cmatrix git wget curl htop nano gpg

## InstalL GCloud
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install -y google-cloud-cli kubectl google-cloud-cli-gke-gcloud-auth-plugin google-cloud-cli-kpt google-cloud-cli-skaffold
echo "Dont forget to run gcloud init"

## Installing Terraform
sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
sudo apt update
sudo apt-get install -y terraform

## Install VSCode
wget -O code-latest.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install -y ./code-latest.deb
rm code-latest.deb

## install Python
sudo apt-get install -y python3 python3-pip

## Setup dev
mkdir ~/code
echo -e "\n\n\n" ssh-keygen -b 4096
