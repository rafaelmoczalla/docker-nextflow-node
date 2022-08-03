FROM alpine:3.12.4

RUN apk add --no-cache \
    openjdk11-jre bash

#install nextflow version 20.10.0
ENV NXF_VER 20.10.0
RUN wget -qO- https://get.nextflow.io | bash && mv nextflow /bin

COPY test.nf test.nf


