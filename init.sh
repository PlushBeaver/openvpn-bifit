#!/usr/bin/env sh

pcscd &
pcscd_pid=$!

openvpn \
    --script-security 2 \
    --up /usr/local/bin/up.sh --up-restart \
    --down /usr/local/bin/down.sh \
    --config /etc/openvpn/client/bifit/bifit.conf &
openvpn_pid=$!

wait ${pcscd_pid} ${openvpn_pid}
