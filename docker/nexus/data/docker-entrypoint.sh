#!/usr/bin/env bash

PARAMS=""

if [ ! -z "$NEXUS_RETRY" ]; then
  PARAMS="$PARAMS --retry-connrefused --retry $NEXUS_RETRY"
  if [ !-z "$NEXUS_RETRY_DELAY" ]; then
    PARAMS="$PARAMS --retry-delay $NEXUS_RETRY_DELAY"
  fi
fi

NEXUS_DEFAULT_PASSWORD=`cat /nexus-data/admin.password`
curl -v -X POST -u admin:$NEXUS_DEFAULT_PASSWORD $PARAMS --header "Content-Type: text/plain" --data "$NEXUS_PASSWORD" "http://localhost:8081/service/rest/v1/script/admin/run"