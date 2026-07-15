🔓 Bandit Level 18 → 19

🎯 Objective

In this level, the password for the next level was stored in a readme file in the home directory. However, during a normal login, a modified .bashrc file would immediately terminate the session and kick the user out.

The main goal was to learn how to bypass restrictions imposed by shell configuration files and to gain access to the system even in non‑standard situations. 🧠

🔍 Solution Steps

After analysing the problem, it became clear that .bashrc had been specially altered to automatically disconnect upon login. The usual way of connecting did not work:

	ssh bandit18@bandit.labs.overthewire.org -p 2220 "cat readme"

🧰 Tools Used

SSH — remote connection with command execution. 🖥️

.bashrc — understanding shell configuration files. 📄

bash — process automation. ⚙️


📚 Skills Acquired

bypassing restrictions set by shell configuration files; 🚪

executing remote commands via SSH without an interactive session; 📡

understanding the loading order of configuration files in Linux; 🧩

using SSH for automated data access. 🔧