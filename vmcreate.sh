#!/bin/bash

#!/bin/bash
file=list_region_createvm.txt
while IFS= read -r locationset
do

#start command
TimeSleepCreateWait=($(shuf -i 10-30 -n 1))
sleep $TimeSleepCreateWait

echo "$locationset"
location="$locationset"
echo $location >> created.txt
echo > VMName.txt

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
#end command

done < "$file"
