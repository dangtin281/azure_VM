
#!/bin/bash
while read p; do
	echo "$p"
az vm start --ids $(az vm list -g $p --query "[].id" -o tsv)
	echo "Started Complete!!!"
	sleep 30
done <GroupResource.txt

echo "new sesssion" > run.log

echo "Next........."
