#!/bin/bash

pass=$1
ports=$2
pass16="pass16.txt"
echo $pass > "$pass16"

remote_commands=$(cat << 'EOF'
        PASS="$1"
        PORTS="$2"
        TARGET="localhost"

        SSL_PORTS=$(nmap --script ssl-cert -p "$PORTS" "$TARGET" | awk -F'/' '/ssl-cert/ {print $1}')

        for port in $SSL_PORTS; do
                (echo $PASS; sleep 1) | openssl s_client -connect $TARGET:$port -quiet 2>/dev/null | sed -n '/-----BEGIN/,/-----END/p' > sshkey16.private
                if [ -s sshkey16.private ]; then
                        chmod 600 sshkey16.private
                        ssh -i sshkey16.private bandit17@bandit.labs.overthewire.org -p 2220
                        rm -f sshkey16.private
                        exit 0

                else
                        echo "не SSL"
                fi
        done
        exit 1
EOF
)

sshpass -f "$pass16" ssh bandit16@bandit.labs.overthewire.org -p 2220 "bash -s" -- "$pass" "$ports" <<< "$remote_commands"
rm -f "$pass16"
