FROM python:3.7-alpine
MAINTAINER Friso Meijer

ENV PYTHONUNBUFFERED 1
COPY ./requierements.txt /requierements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build_deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requierements.txt
RUN apk del .tmp-build_deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
