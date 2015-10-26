#!/bin/bash

rm -f .nodes .agents .masters marathon.json
>> ~/.ssh/known_hosts
container-service --cache-fingerprints
container-service --list-agents
container-service --list-masters
container-service --start-agents
container-service --scale-down 1
container-service --docker-pull-agents azuredemo/web:azurecon --docker-pull-agents azuredemo/rest:azurecon
container-service --delete-marathon-app azure
wget https://raw.githubusercontent.com/rgardler/AzureDevTestDeploy/azurecon/marathon.json
