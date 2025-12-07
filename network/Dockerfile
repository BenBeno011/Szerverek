FROM python:latest
#RUN echo "proxy=http://10.0.0.2:3128" >> /etc/dnf/dnf.conf
#RUN dnf update -y && dnf install python pip -y
RUN pip install flask mysql-connector-python --proxy http://10.0.0.2:3128
COPY ./app.py /app/app.py
WORKDIR /app
EXPOSE 5005
CMD ["python", "app.py"]