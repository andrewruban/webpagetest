# Main service and documentation
https://www.webpagetest.org/

# Start webpagetest on private server via docker-compose and cron (to clear test results by schedule)

### Create systemd service
```
cp webpagetest.service /etc/systemd/system/webpagetest.service
```

### Start systemd service
```
sudo systemctl daemon-reload
sudo systemctl start webpagetest.service
sudo systemctl status  webpagetest.service
sudo systemctl enable  webpagetest.service
```
