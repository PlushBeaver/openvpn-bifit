# Клиент OpenVPN для БИФИТа

Собрать образ: `./build.sh`

В конфиге путь к библиотеке прописан так (устанавливать ничего не надо):

```
pkcs11-providers '/opt/aktivco/rutokenecp/x86_64/librtpkcs11ecp.so'
```

Запустить VPN `./start.sh $HOME/work/bifit.conf`

Должно попросить ввести пароль от токена.

Библиотека в директории `opt` взята с сайта Рутокена:
https://www.rutoken.ru/support/download/pkcs/

Лицензия GPL из-за `update-systemd-resolved`.
