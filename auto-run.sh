
#!/bin/bash
while read p; do
	echo "$p"
az vm start --ids $(az vm list -g $p --query "[].id" -o tsv)
	echo "Started Complete!!!"
done <GroupResource.txt

echo "Done.....1..."

sleep 5
while read p; do
	echo "$p"
az vm start --ids $(az vm list -g $p --query "[].id" -o tsv)
	echo "Started Complete!!!"
done <GroupResource.txt
echo "Done..............2.."

sudo killall python3
echo "new sesssion" > run.log

echo "Next........."
