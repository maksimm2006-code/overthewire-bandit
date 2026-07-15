#!/bin/bash

PASS=$1

sshpass -p "$PASS" ssh \
-p 2220 \
bandit19@bandit.labs.overthewire.org '

./bandit20-do cat /etc/bandit_pass/bandit20
