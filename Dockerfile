FROM alpine:edge

WORKDIR /opt/wirecloud_instance

RUN apk update
RUN apk add --no-cache python py-pip python-dev
RUN pip install -U pip
RUN pip install wheel

RUN apk add --no-cache build-base py-openssl libxml2-dev libxslt-dev zlib-dev pcre-dev curl-dev jpeg-dev
RUN pip install ndg-httpsclient pyasn1 parse

RUN pip install wirecloud

RUN wirecloud-admin startproject wirecloud_instance --quick-start

ADD wirecloud.sh .

EXPOSE 8000

CMD ["wirecloud.sh"]
