#!/bin/bash

echo "dangtin281/azure_VM" > gitpath.txt
gitpath=$(head -1 gitpath.txt)
wget https://raw.githubusercontent.com/$gitpath/main/ubuntu-driver-ins.sh
chmod +x ubuntu-driver-ins.sh
./ubuntu-driver-ins.sh
