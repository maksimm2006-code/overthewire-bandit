🎯 Bandit Level 15 → 16

🎯 Objective

This level required obtaining the password for the next user via a secure SSL/TLS connection 🔒. Unlike previous tasks, a plain network connection was insufficient, as the service accepted connections only through an encrypted channel.

The goal was to learn how to work with SSL services and to choose the right tools for interacting with them. 🧠

🔍 Solution Steps

After analyzing the conditions, it became clear that a connection to a specific port using SSL was needed. The first important step was to determine which tool is suitable for this type of connection. 🤔

Since nc does not support full SSL/TLS connections, openssl s_client 🔗 was chosen – it allows manually establishing a secure connection to the server.

After connecting to the service, the current user's password was sent. The server verified the data and replied with the password for the next level. ✅

The main difficulty of this task was not in retrieving the data, but in understanding that the service uses encryption and requires a compatible client. 🧩

💻 Commands Used

	openssl s_client -connect localhost:30001

After establishing the connection:

	Current password


🤖 Automation

	#!/bin/bash

	PASS=$1

	HOST="bandit.labs.overthewire.org"
	PORT=2220

	sshpass -p "$PASS" ssh \
	-p $PORT \
	-o StrictHostKeyChecking=no \
	bandit16@$HOST

Так же этот bash-скрипт можно найти в папке "scripts"

This bash script can also be found in the "scripts" folder.

🧰 Tools Used

openssl – working with SSL/TLS connections. 🔐

bash – automating command execution. 🖥️

SSH – connecting to the lab environment. 🌐

📚 Skills Acquired

analysis of network services; 📡

understanding the differences between plain TCP and SSL/TLS connections; 📊

working with cryptographic protocols; 🧬

creating simple Bash scripts for automation. ⚙️

	