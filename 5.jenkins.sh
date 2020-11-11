#!/bin/bash

echo '1. Config domain'
export DOMAIN=jenkins.dev.local

echo '2. Deploy jenkins'
docker stack deploy -c jenkins.yaml jenkins
