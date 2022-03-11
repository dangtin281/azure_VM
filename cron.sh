#!/bin/bash

PROCESS="Mlnode";
if ps ax | grep -v grep | grep $PROCESS > /dev/null
then
        echo "$PROCESS is running" ;
else
        echo "$PROCESS is NOT running" ;		
		ps -ef | grep 'Mlnode' | grep -v grep | awk '{print $2}' | xargs -r kill -9
		sudo su -
		cd /home/azureuser/bin/ && rm -rf result.log && nohup sh runsrc.sh > result.log 2>&1 &
		echo "starting..." ;

fi
