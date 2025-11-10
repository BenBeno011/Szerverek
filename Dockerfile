# docker build -t myfedora:v1 .
#	( docker build --tag myfedora:v1 -f ./Dockerfile . )
# docker create -it -v /home/admin:/shared --name fedora01 -hostname fedora01 myfedora:v1
# docker start fedora01
# docker attach fedora01
#
# docker exec -it fedora01 /bin/bash
# docker inspect <containerid_or_imageid>
#

FROM fedora:latest
# ADD dnf.conf /etc/dnf/dnf.conf
RUN echo "proxy=http://10.0.0.2:3128" >> /etc/dnf/dnf.conf
RUN dnf update -y && dnf install mc -y
RUN mkdir -p /shared
# VOLUME ["/home/admin";"/shared"]
ENTRYPOINT ["/bin/bash"]