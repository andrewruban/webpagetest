# Create systemd service
```
cp webpagetest.service /etc/systemd/system/webpagetest.service
```

# Start systemd service
```
sudo systemctl daemon-reload
sudo systemctl start webpagetest.service
sudo systemctl status  webpagetest.service
sudo systemctl enable  webpagetest.service
```
