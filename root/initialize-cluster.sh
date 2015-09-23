#!/bin/bash

rm -f .nodes .agents .masters marathon.json
>> ~/.ssh/known_hosts
container-service --cache-fingerprints
container-service --list-agents
container-service --list-masters
container-service --start-agents
container-service --scale-down 10
container-service --agents-docker-pull azuredemo/web:azurecon --agents-docker-pull azuredemo/rest:azurecon
wget https://raw.githubusercontent.com/mesosphere/AzureDevTestDeploy/master/marathon.json 
