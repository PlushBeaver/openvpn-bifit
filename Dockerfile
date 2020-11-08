FROM ubuntu:20.04

COPY xenial.list /etc/apt/sources.list.d
RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        iproute2 \
        openvpn/xenial \
        pcscd \
        systemd && \
    rm -rf /var/apt/lists/*

COPY opt /opt
COPY init.sh /sbin/init
COPY rules /usr/local/share/
COPY up.sh down.sh update-systemd-resolved /usr/local/bin/

ENTRYPOINT ["/sbin/init"]
