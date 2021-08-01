# Load OS
FROM ubuntu:20.04

# Update system
RUN apt update -y; echo "\n\n\n============"; echo "Updated system"; echo "==========\n\n\n";
RUN apt upgrade -y; echo "\n\n\n============"; echo "Upgraded system"; echo "==========\n\n\n";

# Create user
# -m = create home directory ; -s = set user shell name
RUN useradd -ms /bin/bash django;
# Sanity check
RUN chown django /home/django/

# Config system dependencies
RUN apt install -y python3; echo "\n\n\n============"; echo "INSTALLED python3"; echo "==========\n\n\n";
RUN apt install -y python3-pip; echo "\n\n\n==========="; echo "INSTALLED python3-pip"; echo "===========\n\n\n"; 
RUN apt install -y vim; echo "\n\n\n==========="; echo "INSTALLED vim"; echo "===========\n\n\n"; 
RUN apt install -y git; echo "\n\n\n==========="; echo "INSTALLED git"; echo "===========\n\n\n"; 

# Update system (again)
RUN apt update -y; echo "\n\n\n============"; echo "Updated system again"; echo "==========\n\n\n";
RUN apt upgrade -y; echo "\n\n\n============"; echo "Upgraded system again"; echo "==========\n\n\n";

# Build application code directory
RUN mkdir /home/django/
WORKDIR /home/django/
RUN mkdir ./scripts/

# Install custom requirements
ADD requirements.txt /home/django/
RUN pip install -r requirements.txt

# Add our custom scripts
ADD ./scripts/ /home/django/scripts/

# Add our application (if appropriate)
# ADD . /code/
~               
