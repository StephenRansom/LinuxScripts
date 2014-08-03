#!/bin/bash
########################################################################################
# This script watches "watchedDirectory" for new files of "watchedFiletype"
# When a new file of watchedFiletype is created, it will be transferred to serverAddress
# using "username" as credentials
# e.g. watchedFileType=".txt"
#
# This script assumes that you have access to the target server via authorized SSH keys
# If you do not, then STD:OUT will be prompted for a password when the script transfers
# a file (when using nohup to run this script that will be your nohup.out file)
#
# Intended to be run as "nohup watchThenSCP.sh"
#



watchedDirectory="~/"
watchedFiletype
username=""
serverAddress=" "
targetDirectory="/data/Downloads/torrents"


clear
 inotifywait -m $watchedDirectory -e create |
    while read path action file; do
        
	if [ ${file: -8} == $watchedFiletype ]
	  then
	   echo "The file '$file' appeared in directory '$path' via '$action'"	
           scp /mnt/Data/Downloads/"$file" $username:$serverAddress/$targetDirectory
           
  fi    
  done
