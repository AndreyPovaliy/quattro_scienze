#!/bin/bash

if [[ (-e ./workspace/protocol/str)]] 
then
    bash ./create/protocol/copy.sh
    python3 ./create/protocol/preFile.py > ./create/protocol/scriptProject.sh
    bash ./create/protocol/scriptProject.sh
else
    python3 ./create/protocol/preFile.py > ./create/protocol/scriptProject.sh
    bash ./create/protocol/scriptProject.sh
fi

