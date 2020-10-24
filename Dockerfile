ARG VER=v0.103.3
FROM adguard/adguardhome:${VER} as base
FROM alpine:3.12
ENV AD_UID=1100 \ 
    ADGUARD_CONF="/opt/adguardhome/conf/AdGuardHome.yaml"
COPY --from=base /opt /opt
COPY files /
RUN adduser -u $AD_UID -D -g 'adguard user' -s /sbin/nologin adguard; \
    chown adguard /opt/adguardhome/work /opt/adguardhome/conf; \
    chmod +x /usr/local/bin/entry.sh
USER adguard
ENTRYPOINT ["/usr/local/bin/entry.sh"]
CMD ["/opt/adguardhome/AdGuardHome","-h", "0.0.0.0", "-c", "/opt/adguardhome/conf/AdGuardHome.yaml", "-w", "/opt/adguardhome/work"]
