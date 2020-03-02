#!/usr/bin/env bash

NEXUS_DEFAULT_PASSWORD=`cat /nexus-data/admin.password`
curl -v -X POST -u admin:$NEXUS_DEFAULT_PASSWORD --header "Content-Type: text/plain" --data "$NEXUS_PASSWORD" "http://localhost:8081/service/rest/v1/script/admin/run"