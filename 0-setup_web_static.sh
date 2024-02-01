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

echo "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By 2140-web-01;
    root   /var/www/html;
    index  index.html index.htm;

    location /redirect_me {
        return 301 http://minasseh.me/;
    }

    error_page 404 /404.html;
    location /404 {
      root /var/www/html;
      internal;
    }
}location /hbnb_static {
        alias /data/web_static/current;
        index index.html index.htm;}
}" > /etc/nginx/sites-available/default

service nginx restart
