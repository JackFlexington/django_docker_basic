#!/bin/bash

# Move to user directory
cd ~; 

# Collect user information
while
  echo -e "Welcome to JackFlex's automated process for configuring Django onto a Ubuntu server";
  echo -e 'If you would spare a moment, please answer the following questions?';
  echo -e '-----------------------------------------------------';
  read -p 'Django Project Name: ' DJANGO_PROJECT_NAME;
  read -p 'Django App Name: ' APP_NAME;
  read -p 'Application Port: ' APP_PORT;

  clear;

  echo -e 'Wonderful! Please confirm the values below';
  echo -e '-----------------------------------------------------';
  echo -e 'Django Project Name = ' ${DJANGO_PROJECT_NAME};
  echo -e 'Django App Name     = ' ${APP_NAME};
  read -p 'Application Port    = ' ${APP_PORT};
  echo -e '-----------------------------------------------------';
  read -p 'Is the above information correct? (y/n): ' PROMPT;
  [[ ${PROMPT} != y ]]
do true; done
clear;

# Create Django Project
django-admin startproject ${DJANGO_PROJECT_NAME};

# Create Django App
python3 manage.py startapp ${APP_NAME};

clear;

# Initialize database and test start the server
python3 manage.py makemigrations;
python3 manage.py migrate;
python3 manage.py createsuperuser;
python3 manage.py runserver 0.0.0.0:${APP_PORT};