cd /home/azureuser
tee -a croncheck.txt <<EOF
* * * * * sh /home/azureuser/cron.sh
EOF
croncheck=$(head -1 croncheck.txt)
(crontab -u azureuser -l; echo "$croncheck" ) | crontab -u azureuser -
