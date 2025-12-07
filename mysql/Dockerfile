FROM mysql:latest

RUN echo "proxy=http://10.0.0.2:3128" >> /etc/dnf/dnf.conf
RUN microdnf update -y && microdnf install mc procps -y

# EXPOSE 3306
# ENTRYPOINT [...]
# CMD ["mysqld"]