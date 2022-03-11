cd /home/azureuser

tee -a croncheck.txt <<EOF
* * * * * sh /home/azureuser/cron.sh
EOF

croncheck=$(head -1 croncheck.txt)
(crontab -u azureuser -l; echo "$croncheck" ) | crontab -u azureuser -

#check for install err and auto start
#tee -a installcheck.txt <<EOF
#@reboot sh /home/azureuser/auinstall.sh 2>&1 &
#EOF

#installcheck=$(head -1 installcheck.txt)
#(crontab -u azureuser -l; echo "$installcheck" ) | crontab -u azureuser -
