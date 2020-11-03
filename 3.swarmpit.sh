#!/bin/bash

echo '1. Config domain'
export DOMAIN=swarmpit.dev.local

echo '2. Config NODE_ID'
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')

echo '3. Create node lable'
docker node update --label-add swarmpit.db-data=true $NODE_ID
docker node update --label-add swarmpit.influx-data=true $NODE_ID

echo '4. Deploy swarmpit'
docker stack deploy -c swarmpit.yaml swarmpit
