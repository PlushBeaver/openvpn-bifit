#!/usr/bin/env sh
while read rule; do
    ip rule del $rule || true
    ip rule add $rule
done < /usr/local/share/rules
ip route add default via 10.9.0.1 table 1
