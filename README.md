# Клиент OpenVPN для БИФИТа

Собрать образ:

```
docker build --tag openvpn-bifit .
```

В конфиге путь к библиотеке прописан так (устанавливать ничего не надо):

```
pkcs11-providers '/opt/aktivco/rutokenecp/x86_64/librtpkcs11ecp.so'
```

Запустить образ (нужно прописать путь к конфигу):

```
docker run --rm -it \
    --network=host \
    --privileged \
    -v /absolute/path/to/bifit.conf:/etc/openvpn/client/bifit/bifit.conf \
    openvpn-bifit
```

Должно попросить ввести пароль от токена.

---

Если паранойя не дает использовать `--privileged`, можно дать доступ только
к токену, узнав его bus и device через такую команду:

```
$ lsusb | grep 'Aktiv Rutoken ECP'
Bus 001 Device 006: ID 0a89:0030 Aktiv Rutoken ECP
```

Тогда команда запуска усложняется (на примере вывода предыдущей):

```
docker run --rm -it \
    --network=host \
    --device=/dev/bus/usb/001/006 --device=/dev/net/tun --cap-add=NET_ADMIN \
    -v /absolute/path/to/bifit.conf:/etc/openvpn/client/bifit/bifit.conf \
    openvpn-bifit
```

---

Библиотека в директории `opt` взята с сайта Рутокена:
https://www.rutoken.ru/support/download/pkcs/
