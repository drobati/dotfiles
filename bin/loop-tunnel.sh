#!/usr/bin/env bash
while true
  do ~/bin/tunnel.sh
  echo "Disconnected!"
  sleep 0.5
  echo "Reconnecting..."
done
