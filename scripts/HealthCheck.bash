#!/bin/bash
#######################################################################################
## Script Name :- HealthCheck.bash                                                   ##
## Autor       :- Ankush Sahu                                                        ##
## Description :- Check basic statistics for server                                  ##
## Written Date:- 04-07-2022                                                         ## 
## Usage       :- HealthCheck.bash -H hostname -U user                               ##
#######################################################################################

function get_stats()
{
ssh $2@$1 << EOF
  df -h
  echo "#########################################"
  hostname
EOF
  
 }
 
 
while getopts H:U: flag
  do
    case "${flag}" in
        H) HOSTNAME=${OPTARG};;
        U) USERNAME=${OPTARG};;
    esac
  done
  
get_stats $HOSTNAME $USERNAME


