# Клиент OpenVPN для БИФИТа

Собрать образ: `./build.sh`

В конфиге путь к библиотеке должен быть прописан так
(устанавливать ничего не надо):

```
pkcs11-providers '/opt/aktivco/rutokenecp/x86_64/librtpkcs11ecp.so'
```

Запустить VPN `./start.sh $HOME/work/bifit.conf`

Должно попросить ввести пароль от токена.

Если используется systemd-resolved, нужно добавить опции в конфиг:

```
dhcp-option domain-route bifit.int
dhcp-option DNSSEC no
```

Если нужны DNS для дополнительных доменов, нужно добавить:

```
dhcp-option DNS АДРЕС
dhcp-option domain-route ДОМЕН
```

Библиотека в директории `opt` взята с сайта Рутокена:
https://www.rutoken.ru/support/download/pkcs/

Образ включает `update-systemd-resolved` под лицензией GPLv3.
