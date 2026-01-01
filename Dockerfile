FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Nginx, PHP-FPM and MySQL extension
RUN apt-get update && \
    apt-get install -y nginx php7.4-fpm php7.4-mysql curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create Nginx site config to pass PHP to php-fpm
RUN cat > /etc/nginx/sites-available/default <<'EOF'
server {
    listen 80;
    server_name _;
    root /var/www/html;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start PHP-FPM and Nginx
CMD service php7.4-fpm start && nginx -g 'daemon off;'
