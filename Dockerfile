ARG VER=v0.103.3
FROM adguard/adguardhome:${VER} as base
FROM alpine:3.12
ENV AD_UID=1100
COPY --from=base /opt /opt
RUN adduser -u $AD_UID -D -g 'adguard user' -s /sbin/nologin adguard; \
    chown adguard /opt/adguardhome/work /opt/adguardhome/conf
USER adguard
ENTRYPOINT ["/opt/adguardhome/AdGuardHome"]
CMD ["-h", "0.0.0.0", "-c", "/opt/adguardhome/conf/AdGuardHome.yaml", "-w", "/opt/adguardhome/work"]
