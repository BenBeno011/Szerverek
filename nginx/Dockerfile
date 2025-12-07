FROM nginx:latest

#proxy
COPY ./apt.conf /etc/apt/apt.conf

#html
VOLUME [ "/usr/share/nginx/html/" ]

EXPOSE 80

#CMD [ "nginx", "-g", "daemon off;" ]