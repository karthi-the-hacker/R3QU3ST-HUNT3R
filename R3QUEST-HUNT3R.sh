 #!/bin/bash

clear
./.banner.sh

read -p "Enter file name: " fl
read -p "Enter company name: " comp
mkdir ~/recon/$comp/ &> /dev/null
n=1
cd ~/recon/$comp/
mkdir req-hunter &> /dev/null
cd req-hunter
while read line;do
 echo " Domain $n : $line"
 echo $line | tee -a $fl.txt
 curl -i -s $line | tee $line.txt
 curl -i -s https://$line | tee htt_$line.txt
 n=$((n+1))
done < $fl 
