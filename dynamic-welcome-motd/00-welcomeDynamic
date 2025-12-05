#!/bin/bash

USER_NAME=$(whoami)
HOST_NAME=$(hostname)
UPTIME_INFO=$(uptime -p)
RAM_INFO=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
DISK_INFO=$(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 ")"}')

echo ""
echo "=============================================="
echo " [*]  Bem-vindo, $USER_NAME!"
echo " [*]  Host: $HOST_NAME"
echo " [*]  Data: $(date +"%d/%m/%Y %H:%M")"
echo "----------------------------------------------"
echo " [*]  Uptime: $UPTIME_INFO"
echo " [*]  RAM:    $RAM_INFO"
echo " [*]  Disco:  $DISK_INFO"
echo "=============================================="
echo ""
