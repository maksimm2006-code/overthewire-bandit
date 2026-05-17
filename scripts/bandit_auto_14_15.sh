#!/bin/bash

port=$1
target=$2
pass=$3

NMAP=$(nmap -p $port $target)
if echo $NMAP | grep -q "open";then
        cat $pass | nc $target $port
else
        echo "Port closed"
fi
