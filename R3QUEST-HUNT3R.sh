 #!/bin/bash

clear
./.banner.sh

read -p "Enter file name: " fl
read -p "Enter comany name: " comp
mkdir ~/recon/$comp
n=1
cd ~/recon/$comp/
mkdir req-maker
cd req-hunter
while read line;do
 echo " Domain $n : $line"
 echo $line | tee -a $fl.txt
 curl -i -s $line | tee $line.txt
 n=$((n+1))
done < $fl 
