#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

{
  echo "alias l='ls -CF'"
  echo "alias la='ls -A'"
  echo "alias ll='ls -alF'"
} >>/etc/bash.bashrc
