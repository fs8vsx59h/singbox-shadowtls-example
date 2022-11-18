FROM    ghcr.io/sagernet/sing-box:v1.1-beta14
RUN     mkdir -p /etc/shadowtls \
  &&      touch config.json
COPY --chmod=777 ./mkconfig.sh /mkconfig.sh 
RUN     apk update \
&&  apk add openssl
ENTRYPOINT ["/bin/bash"]
CMD [ "-c","/mkconfig.sh && cat /etc/shadowtls/config.json && /usr/local/bin/sing-box run -c /etc/shadowtls/config.json" ]
