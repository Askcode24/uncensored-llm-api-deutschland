#!/usr/bin/env bash
# Unzensierte LLM-API für Entwickler in Deutschland — quickstart
set -euo pipefail
: "${UNLLM_KEY:?export UNLLM_KEY=sk-...}"

curl -s https://uncensored-llm.sbs/v1/chat/completions \
  -H "Authorization: Bearer $UNLLM_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"uncensored-llm","messages":[{"role":"user","content":"Erklär ohne Umschweife, wie Marktkapitalisierung bei Krypto berechnet wird."}]}' | head -c 2000
echo
