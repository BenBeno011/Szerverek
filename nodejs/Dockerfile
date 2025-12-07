FROM node:latest
# RUN echo "proxy=http://10.0.0.2:3128" >> /etc/dnf/dnf.conf
# RUN dnf update -y && dnf install python pip -y
# RUN pip install flask --proxy http://10.0.0.2:3128
COPY ./server.js /app/server.js
WORKDIR /app
EXPOSE 3000
CMD ["node", "server.js"]