# mengambil php:8.1.1 dan webserver apache sebagai base image untuk docker build
FROM php:8.1.1-apache 

# menyiapkan working directory root
WORKDIR /var/www/html/

# install sqlite3 dan ekstension dari php yaitu pdo
RUN apt-get update && \
    apt-get install -y sqlite3 && \
    docker-php-ext-install pdo

# copy file .php yang sudah dibuat ke dalam kontainer
COPY index.php redlock-db.sql ./

# masukkan file database yang telah dibuat ke sqlite
RUN sqlite3 ./Redlock.sqlite < ./redlock-db.sql

# ubah akses control list owner dan group pada direktori /var/www/html
RUN chown -R www-data:www-data /var/www/html

# hilangkan izin 'write' 'dan excecute'
RUN chmod -R o-wx /var/www/html

# menampilkan port awal yang digunakan
EXPOSE 80

# jalankan service apache secara foreground
CMD ["apache2-foreground"]