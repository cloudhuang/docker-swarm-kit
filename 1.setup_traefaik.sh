#!/bin/bash

echo '1. Create Overray Network'
docker network create --driver=overlay traefik-public

echo '2. Config NODE_ID'
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')

echo '3. Create node tag'
docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID

echo '4. Config email'
export EMAIL=admin@dev.local

echo '5. Config domain'
export DOMAIN=traefik.dev.local

echo '6. Config username'
export USERNAME=admin

echo '7. Config password - default to "admin"'
export PASSWORD=admin
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)

echo '8. Deploy traefik stack'
docker stack deploy -c traefik.yaml traefik
