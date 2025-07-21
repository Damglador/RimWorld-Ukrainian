#!/usr/bin/env bash

cd $(dirname $0)

export CROWDIN_PROJECT_ID=295257

echo "[crowdin-push.sh] Adding custom sources from CustomSources/ to en/"
cp -r CustomSources/* en/

crowdin push
