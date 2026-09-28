#!/usr/bin/env bash
set -euo pipefail

for cmd in git node corepack docker; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
done

echo "Bootstrap prerequisites found."
echo "Node: $(node --version)"
echo "Docker: $(docker --version)"
