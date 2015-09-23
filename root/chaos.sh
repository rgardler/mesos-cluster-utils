#!/bin/bash

container-service --stop-agent 3 --stop-agent 7
sleep 30
container-service --scale-up 30 --exclude-agent 3 --exclude-agent 7
