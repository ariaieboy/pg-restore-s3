FROM ubuntu:22.04
LABEL maintainer="AriaieBOY <ariaieboy.ir@gmail.com>"
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update
RUN apt-get -y install wget gnupg
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update
RUN apt-get -yq install openssl awscli postgresql-client-17

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER **None**
ENV POSTGRES_PASSWORD **None**
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_PATH 'backup'
ENV S3_ENDPOINT **None**
ENV DROP_PUBLIC 'no'

ADD restore.sh restore.sh

CMD ["bash", "restore.sh"]
