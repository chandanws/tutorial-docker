# https://docs.docker.com/engine/reference/builder/#dockerfile-examples
# Dockerfile for an ubuntu version with netcat.
FROM ubuntu:16.04

LABEL version="16.04"
LABEL description="Ubuntu 16.04 with netcat"

RUN apt-get update && \
    apt-get install -y \
    netcat && \
    apt-get clean
