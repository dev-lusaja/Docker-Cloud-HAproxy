#! /bin/bash

docker events -f "label=lb.hook" | while read line; do docker exec balancer /reload.sh; done