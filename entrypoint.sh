#!/bin/sh
set -e
PORT="${PORT:-8080}"
UUID="${UUID:?UUID env required}"
WS_PATH="${WS_PATH:-/fleet}"
sed -e "s/__PORT__/$PORT/g" -e "s/__UUID__/$UUID/g" -e "s|__WS_PATH__|$WS_PATH|g" /usr/local/etc/xray/config.template.json > /usr/local/etc/xray/config.json
exec /usr/local/bin/xray run -config /usr/local/etc/xray/config.json
