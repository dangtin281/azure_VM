#!/bin/bash

gitpath=$(head -1 gitpath.txt)
wget https://raw.githubusercontent.com/$gitpath/main/ins_script.sh
chmod +x ins_script.sh
./ins_script.sh

