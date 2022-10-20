#!/bin/bash

input='.lixeira';
readarray -d '' array < <(find /lab/ -name "$input" -print0);
CMDCRASH=sudo rm -r "${array[@]}";
$CMDCRASH