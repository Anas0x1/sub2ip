#!/bin/bash


echo -e "\033[1;31m
                          #####
  ####   #    #  #####  #     #     #    #####
 #       #    #  #    #       #     #    #    #
  ####   #    #  #####   #####      #    #    #
      #  #    #  #    # #           #    #####
 #    #  #    #  #    # #           #    #
  ####    ####   #####  #######     #    #

\033[0m
"

if [ $# -eq 0 ]; then
echo -e "\033[1;34mDescription : \033[0m \033[33m Converting live subdomains from httpx to IPs \033[0m"
echo -e "\033[1;34mUsage : \033[0m \033[32m sub2ip.sh <live_hosts_path> \033[0m"
else

echo -e "\033[0m \033[32mStarting conversion process .............................................. \033[0m"

cat $1 | cut -d "/" -f 3 | while read line ; do host -t A $line ; done | grep "has address" | cut -d " " -f 4 | sort -u | tee ip.txt

mkdir ip
sudo mv *.txt ip
echo -e "\033[0m \033[32mThe process has completed and saved in ip/ip.txt \033[0m" 
fi
