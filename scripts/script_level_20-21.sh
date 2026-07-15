#!/bin/bash

PASSWORD=$1
HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit20"

CMD="echo 'PASSWORD' | nc -l -p 1234 & sleep 1; ./suconnect 1234" sshpass -p "PASSWORD" ssh -o StrictHostKeyChecking=no -p PORTPORTUSER@HOST"HOST"CMD"