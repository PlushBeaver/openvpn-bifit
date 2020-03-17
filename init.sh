#!/bin/sh

pcscd &
pcscd_pid=$!
openvpn --config /etc/openvpn/client/bifit/bifit.conf &
openvpn_pid=$!
wait ${pcscd_pid} ${openvpn_pid}
