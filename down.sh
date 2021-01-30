#!/usr/bin/env sh

while read rule; do
    ip rule del $rule
done < /usr/local/share/rules

test -e /dev/log && /usr/local/bin/update-systemd-resolved "$@" || true
