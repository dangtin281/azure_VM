#!/bin/bash

echo "awsdiami/CliAzureGit" > gitpath.txt
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
echo "Truy cap URL https://microsoft.com/devicelogin, sau do gan code ben duoi de approve cli access"
az login
read -p "Copy Code ben tren & Paste vao url vua mo, Bam phim bat ky de sang buoc tiep theo " step1

wget https://raw.githubusercontent.com/awsdiami/AzureCLN/main/auto-start.sh
chmod +x auto-start.sh
./auto-start.sh

echo "Kiem tra crontab"
crontab -l

echo "Kiem tra xem da chay chua ?"
echo "tail -f run.log"

