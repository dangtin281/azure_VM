#!/bin/bash

quit=n 
while [  "$quit"   =   "n"  ] 
do 
echo 
echo "============================CREATEVM===================================="
echo "01. eastus -xxx"
echo "02. eastus2 -xxx"
echo "03. southcentralus -xxx"
echo "04. westus -xxx"
echo "05. westus2 -xxx"
echo "06. westus3 -xxx"
echo "07. centralus -xxx"
echo "08. australiseast"
echo "09. southeastasia -xxx"
echo "10. northeurope"
echo "11. uksouth -xxx"
echo "12. westeurope -xxx"
echo "13. centralindia"
echo "14. koreacentral"
echo "15. canadacentral -xxx"
echo "16. francecentral"
echo "17. switzenlandnorth"
echo "18. eastasia -xxx"
echo "=====================CAC REGION DA TAO TRUOC DAY========================"
cat created.txt
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 
1) locationset=eastus;; 
2) locationset=eastus2;;
3) locationset=southcentralus;;
4) locationset=westus;;
5) locationset=westus2;;  
6) locationset=westus3;;
7) locationset=centralus;;
8) locationset=australiseast;;
9) locationset=southeastasia;;
10) locationset=northeurope;;
11) locationset=uksouth;;
12) locationset=westeurope;;
13) locationset=centralindia;;
14) locationset=koreacentral;;
15) locationset=canadacentral;;
16) locationset=francecentral;;
17) locationset=switzenlandnorth;;
18) locationset=eastasia;;	 
	
Q|q) quit=y;; 
*) echo "Try Again" 
esac 
done 
echo "Select done"

echo "$locationset"
location="$locationset"
echo $location >> created.txt
echo > VMName.txt
#Name Generate
#cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 12 | head -n 1 > VMName.txt

LSTWORDARR=(
"ubuntu"
"linux"
"cluster"
"clouder"
"hostserver"
"server"
"nodejs"
"docker"
"redisubuntu"
"postge"
"cdnnetwork"
"publicmain"
"instancef"
"ablautor"
"ablauts"
"ablaze"
"ableder"
"ablegate"
"ablegates"
"abodes"
"aboding"
"abohmmer"
"abohmsome"
"aboideau"
"aboideaus"
"aboideaux"
"aboiljoin"
"aboiteau"
"abrachia"
"abrachias"
"abradable"
"abradant"
"abradants"
"abradenn"
"acetifier"
"acetifiers"
"acetifies"
"acetify"
"canfulul"
"canfuls"
"canglenner"
"cangled"
"canglesin"
"cangling"
"cangueng"
"cangues"
"canicular"
"canidserver"
"canidser"
"cankers"
"cankered"
"dipcanker"
"dipchick"
"dipchicks"
"dipeptidase"
"dipeptide"
"dipeptides"
"dipetalous"
"encarpus"
"encarpuses"
"encasess"
"encased"
"encasement"
"encases"
"encash"
"encashable"
"encashed"
"encashes"
"lukhake"
"hakeanl"
"hakeas"
"hakeem"
"hakeems"
"hakesser"
"hakimer"
"hakims"
"hakunext"
"hakususa"
"halacha"
"halachas"
"inscape"
"inscapes"
"inscience"
"inscient"
"insconce"
"insconced"
"negociant"
"negociants"
"terreen"
"terreens"
"terrella"
"terrellas"
"terrene"
"terrenes"
"upstands"
"upstare"
"upstared"
"upstares"
"upstaring"
"upstart"
"upstarted"
"upstarting"
"upstarts"
"upstate"
"upstater"
"upstaters"
"upstates"
"upstayspot"
"upstayed"
"upstaying"
"upstays"
"upstepspot"
"upstepped"
"upsteps")

WORDTOUSE=($(shuf -n1 -e "${LSTWORDARR[@]}"))
RANDOMNumbers=($(shuf -i 2-99 -n 1))

echo $WORDTOUSE$RANDOMNumbers > VMName.txt

echo "------------------------------------------------------------------------"
cat VMName.txt
echo "------------------------------------------------------------------------"
tmpvmname=$(cat VMName.txt)
echo $tmpvmname
echo "$tmpvmname"_group >> GroupResource.txt
#echo $location >> created.txt

# Tuy chinh VM
size=Standard_NC6s_v3
#size=Standard_B2s
priority=Spot
adminusername=azureuser
adminpassword=12345678@Abc

az group create --location $locationset --resource-group "$tmpvmname"_group

sleep 2

az vm create --resource-group "$tmpvmname"_group --name $tmpvmname --priority $priority --image UbuntuLTS --size $size --public-ip-sku Standard --admin-username $adminusername --admin-password $adminpassword


echo "Done"
#    --custom-data custom-data.txt
