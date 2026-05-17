#!/bin/bash

port=$1
target=$2
pass=$3

NMAP=$(nmap -p $port --script ssl-cert $target)
if echo "$NMAP" | grep -q "open";then
        if echo "$NMAP" | grep -q "ssl-cerl";then
                (sleep 1; echo "$pass"; cat) | openssl s_client -connect $target:$port
        else
                echo "Port does not require SSL/TLS"
        fi
else
        echo "Port closed or not responding"
fi
