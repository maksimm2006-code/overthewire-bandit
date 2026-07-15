🔓 Bandit Level 16 → 17

🎯 Objective

This level required finding, among several open ports, a service that uses SSL and returns a private SSH key for the next user. 🔑

The main goal was to learn how to conduct network reconnaissance and analyse available services. 🕵️

🔍 Solution Steps

First, it was necessary to determine which ports were open on the server and what services were running on them. 📡

For this purpose, a port range scan was performed using nmap 🗺️. After obtaining the list of open ports, the results were analysed.

Among the found services, it was necessary to identify the one that supports SSL. After discovering the appropriate port, an SSL connection was established using openssl s_client 🔗.

After sending the current password, the server returned a private SSH key. 🔐

The obtained key was saved to a separate file. Since SSH requires strict permissions for private keys, the file permissions were changed before use. 🔧

💻 Commands Used

Port scanning:

	nmap -p 31000-32000 -script ssh-cert localhost

Connecting to the found SSL service:

	openssl s_client -connect localhost:PORT

Changing file permissions:

	chmod 600 sshkey

Connecting using the key:

	ssh -i sshkey bandit17@localhost


🤖 Automation

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

🧰 Tools Used

nmap — port scanning and service detection. 🗺️

openssl — working with SSL connections. 🔐

ssh — connecting using a private key. 🖥️

chmod — managing file access permissions. 🔧

📚 Skills Acquired

basic network reconnaissance; 🌍

searching for vulnerable or interesting services; 🎯

working with SSH keys; 🔑

understanding the principles of service identification. 🧩