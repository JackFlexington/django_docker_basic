# Docker Setup

## Configure development environment
### Note: This is the host machine of the Docker application.
### File is designed for Ubuntu 20.04 (Linux)
```
#!/bin/bash
# Source documentation
#  - https://docs.docker.com/engine/install/ubuntu/

# Setup system
sudo -s << EOF
apt -y update && apt -y upgrade;
apt install -y vim;
apt remove -y docker docker-engine docker.io containerd runc;
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg;
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;
EOF

# Install Docker/test installation
sudo -s << EOF
apt upgrade -y;
apt install -y docker-ce docker-ce-cli containerd.io;
docker run hello-world;
EOF

# Install Docker compose
sudo -s << EOF
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
chmod 755 /usr/local/bin/docker-compose;
EOF

# Install Visual Studio code
sudo -s << EOF
apt -y update;
apt install -y software-properties-common apt-transport-https wget;
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -;
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main";
apt install code;
EOF
```

## Configure dockerfile

## Configure docker-compose.yml

## Configure requirements.txt

## Build Docker image
```sudo docker build --tag basic_django . --no-cache```