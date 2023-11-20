#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo chown -R ubuntu:ubuntu /var/www/html
