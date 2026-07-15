#!/bin/bash

PASSWORD=$1
HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit22"

CMD="echo I am user bandit23 | md5sum | cut -d ' ' -f 1 | xargs -I{} cat /tmp/{}"
sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -p $PORT $USER@$HOST "$CMD"