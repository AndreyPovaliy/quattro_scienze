#!/bin/bash

if [[ (-e ./workspace/article/str)]] 
then
    bash ./create/article/copy.sh
    python3 ./create/article/preFile.py > ./create/article/scriptProject.sh
    bash ./create/article/scriptProject.sh
else
    python3 ./create/article/preFile.py > ./create/article/scriptProject.sh
    bash ./create/article/scriptProject.sh
fi

