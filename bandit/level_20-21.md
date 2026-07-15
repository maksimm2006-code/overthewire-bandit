🌐 Bandit Level 20 → 21

🎯 Objective

On this level, a setuid binary file was located in the home directory. It connected to localhost on a specified port, read a line of text, and compared it with the current level's password. If they matched, the program returned the password for the next level.

The main goal was to learn how to work with network connections, use netcat to create a server, and manage background processes in Linux. 🌐

🔍 Solution Steps Using tmux

Step 1: Start tmux

First, create a new tmux session:

	tmux new -s bandit21

Step 2: Split the window into two panes

Inside tmux, split the window horizontally (or vertically) to view both processes simultaneously:

	Ctrl-b % # split vertically

Switch between panes with Ctrl-b o or arrow keys.

Step 3: Start the netcat server in one pane

In the top pane, start netcat in listening mode on port 1234 and pipe the current level's password to it:

	echo "pass" | nc -l -p 1234

The -l flag means listening, -p 1234 specifies the port. In this mode, nc will wait for a connection and send the string from echo when connected.

Step 4: Run suconnect in the other pane

Switch to the second pane (Ctrl-b o) and run:

	./suconnect 1234

The program connects to localhost:1234, reads the sent string, compares it with the correct password, and if correct, outputs the password for the next level.

Step 5: Retrieve the result

The password appears in the pane with suconnect. In the nc pane, you can see that the connection was established and data transferred.

Step 6: Clean up

After obtaining the password, you can close the tmux session:

	tmux kill-session -t bandit21

💻 Commands Used

	tmux new -s bandit21

	echo "GbKksEFF4yrVs6il55v6gwY5aVje5f0j" | nc -l -p 1234

	./suconnect 1234

🤖 Automation

	PASSWORD=$1
	HOST="bandit.labs.overthewire.org"
	PORT=2220
	USER="bandit20"
	
	CMD="echo '$PASSWORD' | nc -l -p 1234 & sleep 1; ./suconnect 1234"
	sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -p $PORT $USER@$HOST "$CMD"

🧰 Tools Used

tmux — terminal multiplexer for managing multiple sessions in one window.

netcat (nc) — creating a network server and client.

setuid — the suconnect program with elevated privileges.

bash — writing scripts for automation.

📚 Skills Acquired

Using tmux to run and monitor multiple processes simultaneously.

Working with network connections via netcat.

Managing background and interactive processes.

Understanding client‑server application interaction.

Creating complex automation scenarios using tmux and bash.
	
