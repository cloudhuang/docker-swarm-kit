#!/bin/bash

echo '1. Config username'
export ADMIN_USER=admin

echo '2. Config password - default to "admin"'
export ADMIN_PASSWORD=admin
export HASHED_PASSWORD=$(openssl passwd -apr1 $ADMIN_PASSWORD)

echo '3. Config domain'
export DOMAIN=dev.local

echo '4. Deploy monitor stack'
docker stack deploy -c mon_stack.yaml mon_stack
