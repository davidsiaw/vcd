FROM ubuntu:22.04 AS build

RUN apt-get update && apt-get install -y build-essential git

RUN mkdir -p /src

COPY Makefile /src/Makefile
COPY vcd.c /src/vcd.c
COPY run.sh /src/run.sh

WORKDIR /src

RUN git clone https://github.com/attractivechaos/klib

RUN make install

ENTRYPOINT ["bash", "run.sh"]
