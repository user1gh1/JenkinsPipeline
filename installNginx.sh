#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo chown -R ubuntu:ubuntu /var/www/html
sudo apt-get update
sudo apt install fontconfig openjdk-17-jre -y
