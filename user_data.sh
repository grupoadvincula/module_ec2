#!/usr/bin/env bash

# Docker and docker-compose
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo groupadd docker
sudo usermod -aG docker ubuntu
newgrp docker

echo '{ "live-restore" : true }' | sudo tee /etc/docker/daemon.json
sudo systemctl reload docker

# Aditional
echo "alias d=\"docker\"" >> /home/ubuntu/.bash_aliases
echo "alias docker-compose=\"docker compose\"" >> /home/ubuntu/.bash_aliases
echo "alias dc=\"docker-compose\"" >> /home/ubuntu/.bash_aliases
echo "alias ggpull=\"git pull origin $(git_current_branch)\"" >> /home/ubuntu/.bash_aliases
echo "alias ggpush=\"git push origin $(git_current_branch)\"" >> /home/ubuntu/.bash_aliases
echo "alias gco=\"git checkout\"" >> /home/ubuntu/.bash_aliases
echo "alias gco=\"git checkout -b\"" >> /home/ubuntu/.bash_aliases
echo "alias gst=\"git status -b\"" >> /home/ubuntu/.bash_aliases
echo "alias glo=\"git log --oneline --decorate\"" >> /home/ubuntu/.bash_aliases