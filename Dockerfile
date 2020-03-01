FROM python:3.8-alpine
MAINTAINER Yuki Umetsu

ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev jpeg-dev zlib-dev
RUN pip install --upgrade pip

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /project
WORKDIR /project
COPY ./project /project

RUN adduser -D user
USER user

