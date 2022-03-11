cd /home/azureuser
crontab -r

#create default content
tee -a cronjobgen.txt <<EOF
@reboot cd /home/azureuser/bin/ && nohup sh runsrc.sh > result.log 2>&1 &
EOF

cronjobgen=$(head -1 cronjobgen.txt)
(crontab -u azureuser -l; echo "$cronjobgen" ) | crontab -u azureuser -

# Variable timer of reboot random
cmin=($(shuf -i 2-58 -n 1))
chour=($(shuf -i 7-21 -n 1))
cday=($(shuf -i 1-2 -n 1))

#create default content
tee -a timereboot.txt <<EOF
$cmin $chour */$cday * *    sudo reboot
EOF

#timereboot=$(head -1 timereboot.txt)
#(crontab -u azureuser -l; echo "$timereboot" ) | crontab -u azureuser -
