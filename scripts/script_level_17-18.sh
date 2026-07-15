#!/bin/bash

PASS="ПАРОЛЬ_BANDIT17"

sshpass -p "$PASS" ssh \
-p 2220 \
bandit17@bandit.labs.overthewire.org '
diff passwords.old passwords.new |
grep "^>"
'