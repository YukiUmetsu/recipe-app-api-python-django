FROM python:3.8-alpine
MAINTAINER Yuki Umetsu

ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-client postgresql-dev gcc python3-dev musl-dev jpeg-dev zlib-dev libc-dev linux-headers
RUN pip install --upgrade pip

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /project
WORKDIR /project
COPY ./project /project

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user

