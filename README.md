# Main service and documentation
https://www.webpagetest.org/

### Required packages to proceed
```
# git 
apt install git

# docker
https://docs.docker.com/engine/install/ubuntu/

# docker-compose
apt install docker-compose 
```

# Start webpagetest on private server via docker-compose and use cron to clear test results by schedule

### Clone 
repo in /opt/webpagetest

### Create systemd service
```
mv /opt/webpagetest/webpagetest.service /etc/systemd/system/webpagetest.service
```

### Start systemd service
```
sudo systemctl daemon-reload
sudo systemctl start webpagetest.service
sudo systemctl enable  webpagetest.service
sudo systemctl status  webpagetest.service
```

### Add www-data user permissions to a folder where you want to write results
```
sudo chown -R www-data /tmp/wpt_results
```

### Check WebPageTest Installation Check
```
http://<IP>/install/
```

### Add log clearing
```
5 2 * * * find /tmp/wpt_results -type f -mtime +62 -exec rm -f {} \;
5 3 * * * find /tmp/wpt_results -type d -empty -mtime +62 -exec rmdir {} \;
```
