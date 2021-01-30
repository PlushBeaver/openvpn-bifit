FROM ubuntu:20.04

COPY xenial.list /etc/apt/sources.list.d
RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        ca-certificates \
        iproute2 \
        openvpn/xenial \
        pcscd \
        systemd \
        wget && \
    rm -rf /var/apt/lists/*

ARG UPDATE_SYSTEMD_RESOLVED_URL=https://raw.githubusercontent.com/jonathanio/update-systemd-resolved/8680a940025d5ef2d837aba254ab067f13be9020/update-systemd-resolved
RUN TARGET=/usr/local/bin/update-systemd-resolved; \
    wget ${UPDATE_SYSTEMD_RESOLVED_URL} -qO ${TARGET} && \
    chmod +x ${TARGET} && \
    apt-get -y autoremove ca-certificates wget

COPY opt /opt
COPY init.sh /sbin/init
COPY rules /usr/local/share/
COPY up.sh down.sh /usr/local/bin/

ENTRYPOINT ["/sbin/init"]
