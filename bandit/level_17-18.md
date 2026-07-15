🏁 Bandit Level 17 → 18

🎯 Objective

In this level, it was necessary to find the password for the next user among two similar files. 📄📄

The main task was to compare the files and find the single difference. 🔍

🔍 Solution Steps

After logging into the server using the SSH key, two text files were found. 📂

Since manually looking for differences between the files would be inefficient, the standard Linux tool diff ⚖️ was used.

The comparison command revealed a line that was present in only one of the files. That line contained the password for the next level. 🔑

This task demonstrated the importance of using standard Linux tools for data analysis instead of manually reviewing large amounts of information. 🧠

💻 Commands Used

Viewing directory contents:

	ls

Comparing files:

	diff passwords.old passwords.new


🤖 Automation

	#!/bin/bash

	PASS=$1

	sshpass -p "$PASS" ssh \
	-p 2220 \
	bandit17@bandit.labs.overthewire.org '

	diff passwords.old passwords.new |
	grep "^>"

	'

🧰 Tools Used

diff — file comparison. ⚖️

bash — automation of analysis. 🖥️

SSH — remote access to the system. 🌐

📚 Skills Acquired

analysis of file changes; 📊

using Unix utilities to find differences; 🛠️

working with remote Linux systems; 💻

automating routine operations. 🤖
