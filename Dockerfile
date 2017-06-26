FROM mysql:8.0.1
MAINTAINER Sebastian Bächle <seb.baechle@gmail.com>

RUN apt-get update && apt-get install -y \
    build-essential \
	&& rm -rf /var/lib/apt/lists/*

COPY ./tools /tools
COPY ./sql /sql

RUN /bin/bash -c 'cd /tools/dbgen; make'
