#!/bin/bash

if [[ (-e ./workspace/disser/str)]] 
then
    bash ./create/disser/run2/buildScript_2.sh 
    bash ./create/disser/run2/scriptProject_2.sh
else
    echo "No stuctere! Run 1st step!" 
fi

