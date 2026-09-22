#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
PORT=8715

# Free the port if something is already listening on it
pids=$(lsof -ti tcp:"$PORT" -sTCP:LISTEN || true)
if [[ -n "$pids" ]]; then
  echo "Port $PORT in use by PID(s) $pids; stopping them"
  kill $pids 2>/dev/null || true
  for _ in {1..10}; do
    lsof -ti tcp:"$PORT" -sTCP:LISTEN >/dev/null || break
    sleep 0.5
  done
  pids=$(lsof -ti tcp:"$PORT" -sTCP:LISTEN || true)
  [[ -n "$pids" ]] && kill -9 $pids 2>/dev/null || true
fi

if [[ ! -d .venv ]]; then
  ./setup.sh
fi
source .venv/bin/activate
exec mkdocs serve --open  # address comes from dev_addr in mkdocs.yml; --open launches the browser
