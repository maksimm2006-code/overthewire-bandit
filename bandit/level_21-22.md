⏰ Bandit Level 21 → 22

🎯 Objective

On this level, a program was automatically launched via cron — the task scheduler in Linux. The task was to examine the cron configuration and find a way to obtain the password for the next user.

The main goal was to learn how to analyse cron jobs and understand how automated processes can be used to store and transfer data. 🕐

🔍 Solution Steps

Step 1: View the contents of the cron directory:

	ls -la /etc/cron.d

Step 2: Analyse the contents of the cron job:

	cat /etc/cron.d/cronjob_bandit22

The output showed that the script /usr/bin/cronjob_bandit22.sh was run as user bandit22 every minute.

Step 3: Examine the script itself:

	cat /usr/bin/cronjob_bandit22.sh

The script created a file in /tmp with a fixed name, gave read permissions to all users, and wrote the bandit22 password into it.

Step 4: Read the password from the temporary file, which contained the password for the next level.

💻 Commands Used

	ls -la /etc/cron.d
	cat /etc/cron.d/cronjob_bandit22
	cat /usr/bin/cronjob_bandit22.sh
	cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv


🤖 Automation

	#!/bin/bash

	PASSWORD=$1
	HOST="bandit.labs.overthewire.org"
	PORT=2220
	USER="bandit21"

	TMP_FILE="/tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv"
	CMD="cat $TMP_FILE"

	sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -p $PORT $USER@$HOST "$CMD"

🧰 Tools Used

cron — task scheduler in Linux. ⏰

cat — viewing file contents. 📄

ls — viewing directory contents. 📂

📚 Skills Acquired

analysing cron job configurations; 🧩

understanding the Linux task scheduler; 📊

finding and reading temporary files created by automated scripts; 🔍

working with system directories /etc/cron.d/ and /tmp/. 📁