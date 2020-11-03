#!/bin/bash

echo '1. Config domain'
export DOMAIN=portainer.dev.local

echo '2. Create node tag'
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
docker node update --label-add portainer.portainer-data=true $NODE_ID

echo '3. Deploy portainer'
docker stack deploy -c portainer.yaml portainer