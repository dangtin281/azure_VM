#!/bin/bash

quit=n 
while [  "$quit"   =   "n"  ] 
do 
echo 
echo "================================================================"
echo "01. Cai Dat Ubuntu NEW"
echo "================================================================"
echo "02. Cai Dat cho Linux da co Driver"
echo "================================================================"
echo "03. Cai Dat LINUX CLI"
echo "================================================================"
echo "04. Tu Dong tao VM"
echo "================================================================"
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 
1) wget https://raw.githubusercontent.com/$gitpath/main/m1.sh && chmod +x m1.sh && ./m1.sh;; 
2) wget https://raw.githubusercontent.com/$gitpath/main/m2.sh && chmod +x m2.sh && ./m2.sh;;
3) wget https://raw.githubusercontent.com/$gitpath/main/m3.sh && chmod +x m3.sh && ./m3.sh;;
4) wget https://raw.githubusercontent.com/$gitpath/main/m4.sh && chmod +x m4.sh && echo "Chay file createdvm.sh de chay";;
	
Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 
echo "Select done"

echo "Done"
