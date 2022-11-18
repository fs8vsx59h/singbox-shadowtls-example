#!/bin/bash

LISTENPORT=443
HANDSHAKESITE=microsoft.com
PASSWORD=`openssl rand -base64 16`

printf '
{
  "route": {
    "rules": [
      {
        "geoip": [
          "cn"
        ],
        "geosite": [
          "cn"
        ],
        "outbound": "block"
      }
    ]
  },
  "inbounds": [
    {
      "type": "shadowtls",
      "listen": "::",
      "listen_port": %s,
      "version": 2,
      "handshake": {
        "server": "%s",
        "server_port": 443
      },
      "detour": "shadowsocks-in"
    },
    {
      "type": "shadowsocks",
      "tag": "shadowsocks-in",
      "listen": "127.0.0.1",
      "method": "2022-blake3-aes-128-gcm",
      "password": "%s"
    }
  ],
  "outbounds": [
    {
      "type": "direct",
      "tag": "direct"
    },
    {
      "type": "block",
      "tag": "block"
    }
  ]
}
'   $LISTENPORT $HANDSHAKESITE $PASSWORD  >  /etc/shadowtls/config.json
