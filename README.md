# Create systemd service

```
vim /etc/systemd/system/webpagetest.service
sudo systemctl daemon-reload
sudo systemctl start webpagetest.service
sudo systemctl status  webpagetest.service
sudo systemctl enable  webpagetest.service
```
