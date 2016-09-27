FROM python:3-alpine

RUN apk add --no-cache curl bash jq

RUN pip install --upgrade pip setuptools

RUN pip install --upgrade httpie

RUN \
  curl -v -L -o /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 && \
  chmod +x /usr/bin/dumb-init

COPY check /opt/resource/check
COPY in    /opt/resource/in
COPY out   /opt/resource/out

RUN chmod +x /opt/resource/out /opt/resource/in /opt/resource/check
