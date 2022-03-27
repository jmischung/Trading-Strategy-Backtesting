#!/bin/bash

# Set the text color for prompts
# requiring the user's feedback.
BLUE='\033[1;34m'
NC='\033[0m'

# Set the password that will be 
# used to log into jupyter.
echo -e "${BLUE}Enter the password you'd like to use to log into Jupyter"
read -sp 'Password: ' jup_passwd1
read -sp $'\x0aVerify password: ' jup_passwd2

# Check that inputs match.
if [ "$jup_passwd1" = "$jup_passwd2" ]; then
  # Build the Docker image
  echo $'\x0aBuilding the Jupyter Lab Docker Image'
  echo -e "${NC}"
  docker build -t trading_lab --build-arg JUP_PASSWD="${jup_passwd1}" .
  echo -e "${BLUE}The Jupyter Lab Docker Image was built successfully${NC}"
else
  # Ask for the password to be reentered until the entries match.
  while [ "$jup_passwd1" != "$jup_passwd2" ]
  do
    echo -e "${BLUE}\x0aThat passwords do not match. Please reenter the password"
    read -sp 'Password: ' jup_passwd1
    read -sp $'\x0aVerify password: ' jup_passwd2
  done
  # Build the Docker image
  echo $'\x0aBuilding the Jupyter Lab Docker Image'
  echo -e "${NC}"
  docker build -t trading_lab --build-arg JUP_PASSWD="${jup_passwd1}" .
  echo -e "${BLUE}The Jupyter Lab Docker Image was built successfully${NC}"
fi
