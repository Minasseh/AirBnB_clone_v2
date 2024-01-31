#!/usr/bin/env bash
# A Bash script that sets up your web servers for the deployment of web_static

sudo apt update
sudo apt install -y nginx

mkdir -p /data/
chown -R ubuntu: /data/
mkdir -p /data/web_static/
mkdir -p /data/web_static/releases/
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/

echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html

# Create symbolic link
ln -sf /data/web_static/releases/test/ /data/web_static/current
