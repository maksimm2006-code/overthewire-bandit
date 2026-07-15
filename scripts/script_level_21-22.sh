#!/bin/bash

PASSWORD=$1
HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit21"

TMP_FILE="/tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv"
CMD="cat $TMP_FILE"

sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -p $PORT $USER@$HOST "$CMD"