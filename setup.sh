#! /usr/bin/env bash
set -euox pipefail

# Install required software
# docker-ce ( https://docs.docker.com/engine/install/ubuntu/ )
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker -v

# docker-compose
sudo apt-get install -y docker-compose
sudo docker-compose -v

# create web-page-test systemd service
cd /opt/webpagetest
sudo mv webpagetest.service /etc/systemd/system/webpagetest.service

# Add www-data user permissions to a folder where you want to write results
sudo mkdir -p /root/wpt_results
sudo chown -R www-data /root/wpt_results

# Start web-page-test systemd service
sudo systemctl daemon-reload
sudo systemctl start webpagetest.service
sudo systemctl enable webpagetest.service
sudo systemctl status webpagetest.service

# Add web-page-test log clearing by cron
echo "5 2 * * * root find /root/wpt_results -type f -mtime +62 -exec rm -f {} \;" >> /etc/crontab
echo "5 3 * * * root find /root/wpt_results -type d -empty -mtime +62 -exec rmdir {} \;" >> /etc/crontab
