#!/bin/bash
#Purpose: Check whether any Docker processes are active and if they are, either kill or continue.
#Version: 1.0
#Created Date: Sun, Apr  2, 2023 12:38:19 AM
#Modified Date: Just Created
#Author: Mainul Sunvi

# START #

containers=$(docker ps -q)

if [ ! -z $containers ]; 
then
  docker kill $containers;
fi

docker build -t todo-app .
docker run -d -p 3000:3000 todo-app

# END #
