FROM ghcr.io/xtls/xray-core:26.10.31 AS xray
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=xray /usr/local/bin/xray /usr/local/bin/xray
COPY --from=xray /usr/local/share/xray/ /usr/local/share/xray/
COPY config.template.json /usr/local/etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
CMD ["/entrypoint.sh"]
