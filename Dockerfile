# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #леха дохера умный
#                                                     +:+ +:+         +:+      #
#    By: gdoge <gdoge@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/25 09:44:55 by gdoge             #+#    #+#              #
#    Updated: 2020/11/26 21:04:09 by gdoge            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

WORKDIR	/var/www/html

#downloading and installing of necessary packages
RUN		apt-get update

#we use curl to download by link (also wget possible)
RUN		apt-get install -y curl

#just vim (in case it will be necessary)
#RUN		apt-get install -y vim

#LEMP software downloading (only EMP here actually)
RUN		apt-get install -y mariadb-server
RUN		apt-get install -y nginx
RUN		apt-get -y install php-mysql php-fpm php-mbstring php7.3 php-pdo php-gd php-cli php-mbstring

WORKDIR	/var/www/html

#wordpress downloading, unzipping, moving it to right directory and removing of unzipped archive
RUN		curl -O https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN		tar vxf latest-ru_RU.tar.gz
RUN		rm -rf latest-ru_RU.tar.gz

#phpMyAdmin downloading, unzipping, moving it to right directory and removing of unzipped archive
RUN curl -O https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar vxf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin

#copying from host filesystem to docker container filesystem
WORKDIR /var/www/html/

COPY	./srcs/container_init.sh ../../../
COPY	./srcs/default ../../../etc/nginx/sites-available/
COPY	./srcs/config.inc.php phpmyadmin/
COPY	./srcs/wp-config.php wordpress/

WORKDIR /
#generating of ssl-key details: https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-debian-10
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21_school/OU=programming_school/CN=abhutiev" \
-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

#removing of default nginx page;
RUN rm -f /var/www/html/index.nginx-debian.html

#changing of rights for correct work
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/*
RUN chmod +x *.sh

#script, that turning on all services and configuring wordpress database
CMD bash container_init.sh
