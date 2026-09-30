#!/usr/bin/env bash
set -euo pipefail

docker network create \
  --driver bridge \
  --subnet 172.20.0.0/24 \
  reverse_proxy || echo "reverse_proxy already exists"

docker network create \
  --internal \
  --driver bridge \
  --subnet 172.21.0.0/24 \
  internal || echo "internal already exists"

docker network create \
  --driver bridge \
  --subnet 172.22.0.0/24 \
  monitoring || echo "monitoring already exists"

docker network ls | grep -E "reverse_proxy|internal|monitoring"

# "already exists" doesn't fix an old network, so verify
[ "$(docker network inspect internal --format '{{.Internal}}')" = "true" ] \
  || echo "WARNING: internal network is NOT internal"
