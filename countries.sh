#!/usr/bin/bash

now=$(date +"%Y_%m_%d_%H_%M_%S")
LOGFILE=logfile-$now.txt
exec 2> $LOGFILE

curl -s "https://gist.githubusercontent.com/kalinchernev/486393efcca01623b18d/raw/daa24c9fea66afb7d68f8d69f0c4b8eeb9406e83/countries" > countries.txt

while IFS= read -r line; do
	if [[ "${line,,}" == p* ]]; then
			echo "${line^^}"
		fi
done < countries.txt

echo "Type a country name: "
read uservar

if grep -Fxqi "${uservar,,}" countries.txt  
	then
		echo "True"
	else
		echo "False"
fi

if ! [ -s $LOGFILE ];then
    rm $LOGFILE
fi