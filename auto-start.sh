#!/bin/bash

#Get path from Cronjob

whoami > name.txt
namepath=$(head -1 name.txt)
path=/home/$namepath
gitpath=$(head -1 gitpath.txt)


#Get subscription name:
az account list-locations > list-location.txt
#Get subscribe ID
awk 'NR==4' list-location.txt > sub_idraw.txt
cut -c 27-62 sub_idraw.txt > sub_id.txt

subid=$(head -1 sub_id.txt)

#Get all ResourceGroup in subscription
az group list --subscription $subid

read -p "Nhap vao ten ResourceGroup: " NameResourceGroup
echo "Data received"
echo $NameResourceGroup >> GroupResource.txt

wget https://raw.githubusercontent.com/$gitpath/main/auto-run.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-add.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-setsub.sh
wget https://raw.githubusercontent.com/$gitpath/main/auto-sys-cron.sh
chmod +x auto-run.sh
chmod +x auto-add.sh
chmod +x auto-setsub.sh
chmod +x auto-sys-cron.sh



#Reboot fixing lag
cd /home/azureuser
tee -a reboot10800.txt <<EOF
@reboot sleep 8000 && sudo reboot 2>&1 &
EOF

reboot10800=$(head -1 reboot10800.txt)
(crontab -u azureuser -l; echo "$reboot10800" ) | crontab -u azureuser -


#cd $path
#crontab -r
sudo service cron force-reload
sudo service cron restart
sudo service cron start

./auto-sys-cron.sh


