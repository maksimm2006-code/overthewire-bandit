🎯 Bandit Level 19 → 20

🎯 Objective

In this level, it was required to use a setuid binary file in the home directory to obtain the password for the next user.

The main goal was to learn how to work with the setuid mechanism and to understand how it allows temporarily elevating privileges to perform specific operations. 🔐

🔍 Solution Steps

After logging into the server, the contents of the home directory were listed:

	ls -l

A file named bandit20-do with special permissions was found: -rwsr-x---. The letter s in the owner's permission field indicated that the setuid bit was set — the file would be executed with the owner's privileges (bandit20), not the user who ran it.

When run without arguments, the program showed its usage:

	./bandit20-do

This meant that any command could be executed with the privileges of user bandit20. The password for bandit20 was stored in /etc/bandit_pass/bandit20, which only bandit20 could access.

Using the setuid binary, it was possible to read that file:

	./bandit20-do cat /etc/bandit_pass/bandit20

The command ran with bandit20's rights and returned the password for the next level. 🎉

💻 Commands Used

	ls -l
	./bandit20-do
	./bandit20-do cat /etc/bandit_pass/bandit20

💻 Использованные команды

	ls -l
	./bandit20-do
	./bandit20-do cat /etc/bandit_pass/bandit20

🤖 Automation

	#!/bin/bash

	PASS=$1

	sshpass -p "$PASS" ssh \
	-p 2220 \
	bandit19@bandit.labs.overthewire.org '

	./bandit20-do cat /etc/bandit_pass/bandit20

	'

🧰 Tools Used

setuid — privilege escalation mechanism. 🔑

ls -l — viewing file permissions. 📂

cat — reading file contents. 📄


📚 Skills Acquired

understanding the setuid mechanism and its application; 🧬

analysing file permissions in Linux; 📊

executing commands with another user's privileges; ⚡

working with system password files. 🔐