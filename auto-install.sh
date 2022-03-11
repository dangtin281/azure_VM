#!/bin/bash

gitpath=$(head -1 gitpath.txt)


curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
echo "Truy cap URL https://microsoft.com/devicelogin, sau do gan code ben duoi de approve cli access"
az login
read -p "Copy Code ben tren & Paste vao url vua mo, Bam phim bat ky de sang buoc tiep theo " step1

wget https://raw.githubusercontent.com/$gitpath/main/auto-start.sh
wget https://raw.githubusercontent.com/$gitpath/main/cmdviewgroup.sh

chmod +x auto-start.sh 
chmod +x cmdviewgroup.sh
./auto-start.sh

echo "Kiem tra crontab"
crontab -l

echo "Kiem tra xem da chay chua ?"
echo "tail -f run.log"
echo "Run file m4.sh"
chmod +x m4.sh
./m4.sh

echo "Done"
