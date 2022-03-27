#!/usr/local/opt/expect -f

# Disable timeout.
set timeout -1

# Run the script to create a
# password for Jupyter.
spawn ./jup_passwd.sh

expect "Enter password:"
send -- "$env(JUP_PASSWD)\r"

expect "Verify password:"
send -- "$env(JUP_PASSWD)\r"

expect eof

