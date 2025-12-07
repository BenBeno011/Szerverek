FROM httpd:latest

#proxy
COPY ./apt.conf /etc/apt/apt.conf

#apt
RUN apt update -y && apt install mc procps -y

#html
VOLUME [ "/usr/local/apache2/htdocs/" ]

#EXPOSE 80
#CMD [httpd-foreground]