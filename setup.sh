#! /usr/bin/env bash
set -euox pipefail

# create web-page-test systemd service
cd /opt/webpagetest
sudo mv webpagetest.service /etc/systemd/system/webpagetest.service

# Start web-page-test systemd service
sudo systemctl daemon-reload
sudo systemctl start webpagetest.service
sudo systemctl enable webpagetest.service
sudo systemctl status webpagetest.service

# Add www-data user permissions to a folder where you want to write results
sudo mkdir -p /root/wpt_results
sudo chown -R www-data /root/wpt_results

# Add web-page-test log clearing by cron
echo "5 2 * * * find /root/wpt_results -type f -mtime +62 -exec rm -f {} \;" | tee -a /var/spool/cron/root
echo "5 3 * * * find /root/wpt_results -type d -empty -mtime +62 -exec rmdir {} \;" >> /var/spool/cron/root
