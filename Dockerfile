FROM debian:stretch

WORKDIR /opt

RUN apt update
RUN apt install -y python3 python3-pip python3-dev python3-setuptools git \
libxml2-dev libxslt1-dev zlib1g-dev libpcre3-dev libcurl4-openssl-dev libjpeg-dev

RUN pip3 install -U pip

RUN git clone https://github.com/Wirecloud/wirecloud.git && \
sed -i 's/term .*derivate work.* used/term "derivate work" used/' wirecloud/README.md && \
cd wirecloud/src && pip install -r requirements.txt && python3 setup.py install

RUN pip install Django==1.10 django-haystack==2.6.0 django-compressor==2.0

RUN wirecloud-admin startproject wirecloud_instance --quick-start

EXPOSE 8000

RUN python3 wirecloud_instance/manage.py populate

RUN rm -r /root/.cache/pip
RUN rm -r wirecloud
RUN apt autoclean
RUN apt clean

ENTRYPOINT ["python3 wirecloud_instance/manage.py runserver 0.0.0.0:8000 --insecure"]
