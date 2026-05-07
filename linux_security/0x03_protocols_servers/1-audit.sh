#!/bin/bash

CONFIG_FILE="/etc/ssh/sshd_config"

# List of keys we want to audit
KEYS=(
  "Include"
  "KbdInteractiveAuthentication"
  "UsePAM"
  "X11Forwarding"
  "PrintMotd"
  "AcceptEnv"
  "Subsystem"
  "PasswordAuthentication"
  "PermitRootLogin"
  "AuthorizedKeysFile"
  "TCPKeepAlive"
)

# Function to extract effective config (main file only; simple approach)
get_value() {
  local key="$1"
  grep -Ei "^[[:space:]]*${key}[[:space:]]+" "$CONFIG_FILE" | tail -n 1
}

# Print results
for key in "${KEYS[@]}"; do
  line=$(get_value "$key")
  if [ -n "$line" ]; then
    echo "$line" | sed 's/^[[:space:]]*//'
  fi
done
