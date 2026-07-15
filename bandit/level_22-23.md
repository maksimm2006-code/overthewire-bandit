🔐 Bandit Level 22 → 23

🎯 Objective

On this level, as in the previous one, a program was automatically launched via cron. However, this time the filename in /tmp was generated dynamically using a hash function, which made it harder to locate.

The main goal was to learn how to read and analyse bash scripts, and to reproduce their logic in order to predict dynamically generated data. 🧠

🔍 Solution Steps

Step 1: View the cron configuration:

	cat /etc/cron.d/cronjob_bandit23

The output indicated that the script /usr/bin/cronjob_bandit23.sh was executed as user bandit23.

Step 2: Analyse the script:

	cat /usr/bin/cronjob_bandit23.sh

The script generated a filename by computing the MD5 hash of the string I am user bandit23 and using it as the filename in /tmp.

Step 3: Reproduce the logic to obtain the filename:

	echo I am user bandit23 | md5sum | cut -d ' ' -f 1

Step 4: Read the password from the generated file:

	cat /tmp/$(echo I am user bandit23 | md5sum | cut -d ' ' -f 1)

The password for the next level was successfully obtained. 🎉


💻 Commands Used

	cat /etc/cron.d/cronjob_bandit23
	cat /usr/bin/cronjob_bandit23.sh
	echo I am user bandit23 | md5sum | cut -d ' ' -f 1
	cat /tmp/8ca319486bfbbc3663ea0fbe81326349


🤖 Automation

	#!/bin/bash

	PASSWORD=$1
	HOST="bandit.labs.overthewire.org"
	PORT=2220
	USER="bandit22"

	CMD="echo I am user bandit23 | md5sum | cut -d ' ' -f 1 | xargs -I{} cat /tmp/{}"
	sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -p $PORT $USER@$HOST "$CMD"

🧰 Tools Used

md5sum — computing MD5 hashes. 🔢

cut — extracting parts of a string. ✂️

cron — task scheduler. ⏰

bash — writing scripts. 🖥️

📚 Skills Acquired

reading and analysing bash scripts; 📖

reproducing script logic to predict outcomes; 🧩

working with hash functions on the command line; 🔐

understanding dynamic filename generation. 📁
