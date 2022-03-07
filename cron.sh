#!/bin/bash

PROCESS="t-rex";
if ps ax | grep -v grep | grep $PROCESS > /dev/null
then
        echo "$PROCESS is running" ;
else
        echo "$PROCESS is NOT running" ;		
		ps -ef | grep 't-rex' | grep -v grep | awk '{print $2}' | xargs -r kill -9
		sudo su -
		cd /home/azureuser/ && rm -rf result.log && nohup sh runsrc.sh > result.log 2>&1 &

fi
