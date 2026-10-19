
#!/bin/sh

set -eu

CONTAINER_NAME="tp-devops-smoke-$$"

cleanup() {
  docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
}

trap cleanup EXIT

docker run -d \
  --name "$CONTAINER_NAME" \
  -p 127.0.0.1::3000 \
  tp-devops-api:1.0.0

sleep 3

RESPONSE=$(curl -fsS \
  "http://127.0.0.1:$(docker port "$CONTAINER_NAME" 3000/tcp | awk -F: '{print $NF}')/health") || exit 1

echo "Réponse API : $RESPONSE"

echo "$RESPONSE" | grep -q '"status":"ok"' || exit 1

echo "Smoke test réussi !"
