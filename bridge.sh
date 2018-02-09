#!/bin/sh
# Inspired in https://github.com/cdosso/docker-port-forward

TARGET_IP=$(ip route | awk '/default/ { print $3 }')
TARGET_PORT=${TARGET_PORT:-$INPUT_PORT}

sysctl -w net.ipv4.ip_forward=1
iptables -F
iptables -t nat -F
iptables -X
iptables -t nat -A PREROUTING -p tcp --dport $INPUT_PORT  -j DNAT --to-destination $TARGET_IP:$TARGET_PORT
iptables -t nat -A POSTROUTING -j MASQUERADE

echo "forwarding $INPUT_PORT to $TARGET_IP:$TARGET_PORT"
while sleep 1000d; do :; done
