#!/bin/sh

wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-armv7.tar.gz
tar -xvf ./node_exporter-0.18.1.linux-armv7.tar.gz
mkdir /usr/local/bin/test
mv ./node_exporter-0.18.1.linux-armv7/node_exporter /usr/local/bin
chmod +x /usr/local/bin/node_exporter
useradd -m -s /bin/bash node_exporter
mkdir /var/lib/node_exporter
chown -R node_exporter:node_exporter /var/lib/node_exporter
https://gist.githubusercontent.com/ipl31/1f6a00f40448c9e5d78d49c02a7f1caa/raw/b05e28a6ca1c89e815747e8f7e186a634518f9c1/node_exporter.service
mv node_exporter.service /etc/systemd/system
systemctl daemon-reload
systemctl enable node_exporter.service
systemctl start node_exporter.service 
