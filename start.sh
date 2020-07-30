#!/usr/bin/env sh

conf=${1:-${HOME}/work/bifit.conf}
addr=`lsusb | grep 0a89:0030 | sed -e 's,^Bus \([0-9]\{3\}\) Device \([0-9]\{3\}\).*,\1/\2,'`

docker run --rm -it \
    --network=host \
    --device=/dev/bus/usb/${addr} --device=/dev/net/tun --cap-add=NET_ADMIN \
    -v ${conf}:/etc/openvpn/client/bifit/bifit.conf \
  openvpn-bifit
