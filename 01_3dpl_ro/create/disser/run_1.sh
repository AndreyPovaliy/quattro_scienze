#!/bin/bash

if [[ (-e ./disser/str)]] 
then
    bash ./create_disser/copy.sh
    bash ./create/disser/run1/buildScript_1.sh 
    bash ./create/disser/run1/scriptProject_1.sh
else
    bash ./create/disser/run1/buildScript_1.sh 
    bash ./create/disser/run1/scriptProject_1.sh
fi

