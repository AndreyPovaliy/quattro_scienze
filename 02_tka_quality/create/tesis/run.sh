#!/bin/bash

if [[ (-e ./workspace/tesis/str)]] 
then
    bash ./create/tesis/copy.sh
    python3 ./create/tesis/preFile.py > ./create/tesis/scriptProject.sh
    bash ./create/tesis/scriptProject.sh
else
    python3 ./create/tesis/preFile.py > ./create/tesis/scriptProject.sh
    bash ./create/tesis/scriptProject.sh
fi

