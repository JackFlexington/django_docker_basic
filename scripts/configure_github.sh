#!/bin/bash

# Move to user directory
cd ~;

# Collect user information
while
  echo -e "Welcome to JackFlex's automated process for configuring Django onto a Ubuntu server";
  echo -e 'If you would spare a moment, please answer the following questions?';
  echo -e '-----------------------------------------------------';
#   read -p 'Username for database admin?: ' DB_USERNAME;
#   read -p 'Password for database admin?: ' DB_PASSWORD;
  read -p 'Git username?: ' GIT_USERNAME;
  read -p 'Git email?: ' GIT_EMAIL;

  clear;

  echo -e 'Wonderful! Please confirm the values below';
  echo -e '-----------------------------------------------------';
#   echo -e 'Database username = ' ${DB_USERNAME};
#   echo -e 'Database password = ' ${DB_PASSWORD};
  echo -e 'Git username = ' ${GIT_USERNAME};
  echo -e 'Git email = ' ${GIT_EMAIL};
  echo -e '-----------------------------------------------------';
  read -p 'Is the above information correct? (y/n): ' PROMPT;
  [[ ${PROMPT} != y ]]
do true; done
clear;

# Configure Git
git config --global user.name "${GIT_USERNAME}";
git config --global user.email "${GIT_EMAIL}";