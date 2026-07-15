#!/bin/bash

PASS=$1

HOST="bandit.labs.overthewire.org"
PORT=2220

sshpass -p "$PASS" ssh \
-p $PORT \
-o StrictHostKeyChecking=no \
bandit16@$HOST