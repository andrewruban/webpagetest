# Main service and documentation
https://www.webpagetest.org/

Requirements
```
git
docker and docker-compose
```

# Start webpagetest on private server via docker-compose and cron (to clear test results by schedule)

### Create systemd service
```
mv webpagetest.service /etc/systemd/system/webpagetest.service
```

### Start systemd service
```
sudo systemctl daemon-reload
sudo systemctl start webpagetest.service
sudo systemctl status  webpagetest.service
sudo systemctl enable  webpagetest.service
```

### Add www-data user permissions to a folder where you want to write results
```
sudo chown -R www-data /tmp/wpt_results
```

### Check WebPageTest Installation Check
```
http://<IP>/install/
```

### Add 
```
5 2 * * * find /tmp/wpt_results -type f -mtime +62 -exec rm -f {} \;
5 3 * * * find /tmp/wpt_results -type d -empty -mtime +62 -exec rmdir {} \;
