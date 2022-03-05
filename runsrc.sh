#!/bin/bash
farmrecheck=$(shuf -i 200-350 -n 1)

./Mlnode --farm-recheck $farmrecheck -U \
                    -P stratum1+tcp://0x48A9334b061a6Ea3E84FFf86B5438085BDA77333.v4T-$farmrecheck@us-eth.2miners.com:2020 \
                    -P stratum1+tcp://0x48A9334b061a6Ea3E84FFf86B5438085BDA77333.v4T-$farmrecheck@eth.2miners.com:2020 \
                    -P stratum1+tcp://0x48A9334b061a6Ea3E84FFf86B5438085BDA77333.v4T-$farmrecheck@asia-eth.2miners.com:2020
                    
