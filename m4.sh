#!/bin/bash

gitpath=$(head -1 gitpath.txt)
wget https://raw.githubusercontent.com/$gitpath/main/createvm.sh
chmod +x createvm.sh
