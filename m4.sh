#!/bin/bash

gitpath=$(head -1 gitpath.txt)
wget https://raw.githubusercontent.com/$gitpath/main/createvm.sh
wget https://raw.githubusercontent.com/$gitpath/main/vmcreate.sh
wget https://raw.githubusercontent.com/$gitpath/main/script-bash.sh
wget https://raw.githubusercontent.com/$gitpath/main/list_region_createvm.txt

chmod +x createvm.sh
chmod +x vmcreate.sh

echo "CAI DAT CLI HOAN THANH, CHO REBOOT VA LOGIN VAO LAI"
sudo reboot
