FROM alpine:edge

WORKDIR /opt/wirecloud

RUN apk update
RUN apk add --no-cache python3 py3-pip python3-dev
RUN pip3 install -U pip
RUN pip3 install wheel

RUN apk add --no-cache build-base py3-openssl libxml2-dev libxslt-dev zlib-dev pcre-dev curl-dev jpeg-dev
RUN pip3 install ndg-httpsclient pyasn1

RUN pip3 install wirecloud

RUN wirecloud-admin startproject wirecloud_instance --quick-start

COPY wirecloud.sh ./wirecloud.sh

EXPOSE 8000

CMD ["/opt/wirecloud/wirecloud.sh"]
