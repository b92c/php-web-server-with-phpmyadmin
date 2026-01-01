# PHP web server + MySQL (PHPMyAdmin)

This repository provides a minimal Docker setup that runs a PHP web server with Nginx, a MySQL database, and phpMyAdmin for database management.

Services
- web: Nginx + PHP-FPM serving files from ./public (built from the included Dockerfile).
- db: MySQL 5.7 (data persisted in the volume `db_data`).
- phpmyadmin: phpMyAdmin available on port 8080 to manage the MySQL database.

Quickstart
1. Place your PHP application files in the `public/` directory (index.php is served by default).
2. Start the stack: `docker-compose up --build`.
3. Access the app at: http://localhost/
4. Access phpMyAdmin at: http://localhost:8080 (use host `db`, user `root`, password `myrootpass`).

Notes
- MySQL root password and initial database are set in docker-compose.yml (MYSQL_ROOT_PASSWORD=myrootpass, MYSQL_DATABASE=mydb).
- The Dockerfile builds an Ubuntu-based image with Nginx and PHP-FPM configured to serve PHP files.
