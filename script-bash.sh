#!/bin/sh

echo "dangtin281/azure_VM" > /home/azureuser/gitpath.txt
#cd /home/azureuser
gitpath=$(head -1 /home/azureuser/gitpath.txt)
wget https://raw.githubusercontent.com/$gitpath/main/m1.sh
cp m1.sh /home/azureuser/m1.sh && chmod +x /home/azureuser/m1.sh

wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
cp auinstall.sh /home/azureuser/auinstall.sh && chmod +x /home/azureuser/auinstall.sh

echo "installing" > /home/azureuser/install.txt

tee -a installcheck.txt <<EOF
@reboot sh /home/azureuser/auinstall.sh 2>&1 &
EOF

installcheck=$(head -1 installcheck.txt)
(crontab -u azureuser -l; echo "$installcheck" ) | crontab -u azureuser -

cd /home/azureuser/
./m1.sh
#sudo chown -R azureuser:azureuser /home/azureuser/bin/
sudo chown -R azureuser:azureuser /home/azureuser/
rm -rf /home/azureuser/install.lock
echo "Install Completed" > /home/azureuser/installed.lock

echo ""
