#!/usr/bin/env bash

set -e

cd "$(dirname "$0")" || exit

export CROWDIN_PROJECT_ID=295257
[ -z "$CROWDIN_PERSONAL_TOKEN" ] && export CROWDIN_PERSONAL_TOKEN=$(pass crowdin/api/rimworld)

echo "[crowdin-push.sh] Adding custom sources from CustomSources/ to en/"
cp -r CustomSources/* en/

crowdin push
