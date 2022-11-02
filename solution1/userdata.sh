#!/bin/bash
sudo apt update -y
sudo apt install openjdk-8-jdk -y
sudo apt install apt-transport-https -y

###Installing Elasticsearch###
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-amd64.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-amd64.deb.sha512
shasum -a 512 -c elasticsearch-8.4.3-amd64.deb.sha512 
sudo dpkg -i elasticsearch-8.4.3-amd64.deb

sudo echo 'transport.host: 127.0.0.1' >> /etc/elasticsearch/elasticsearch.yml
sudo systemctl daemon-reload
sudo systemctl enable --now elasticsearch.service
sudo systemctl start elasticsearch.service

###Resetting Password for elasticsearch & uploading it to s3 bucket for later use###
sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password --batch -u  elastic  > /tmp/elastic.txt
sudo apt install awscli -y
sudo aws s3 cp /tmp/elastic.txt s3://terraform-elastic