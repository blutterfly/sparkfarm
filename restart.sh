#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

port=8012
fuser -k -TERM "${port}/tcp" 2>/dev/null || true

exec .venv/bin/mkdocs serve --dev-addr "127.0.0.1:${port}"
