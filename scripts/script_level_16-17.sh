#!/bin/bash

PASS=$1

sshpass -p "$PASS" ssh \
-o StrictHostKeyChecking=no \
-p 2220 \
bandit16@bandit.labs.overthewire.org "
for port in \$(seq 31000 32000)
do
    	RESULT=\$(echo '$PASS' | timeout 2 openssl s_client \
        -quiet \
        -connect localhost:\$port 2>/dev/null)

    	if echo \"\$RESULT\" | grep -q 'BEGIN RSA PRIVATE KEY'; then
       		 echo \"Найден ключ на порту \$port\"
        	echo \"\$RESULT\" | sed -n '/BEGIN RSA PRIVATE KEY/,/END RSA PRIVATE KEY/p'
        	break
    	fi
done
"