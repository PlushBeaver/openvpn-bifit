FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        openvpn \
        pcscd

COPY opt /opt
COPY init.sh /sbin/init

ENTRYPOINT ["/sbin/init"]
