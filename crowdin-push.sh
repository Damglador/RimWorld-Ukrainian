#!/usr/bin/env bash

cd "$(dirname "$0")" || exit

export CROWDIN_PROJECT_ID=295257
[ -z "$CROWDIN_PERSONAL_TOKEN" ] && export CROWDIN_PERSONAL_TOKEN=$(cat "$HOME/Documents/Vaults/Secrets/crowdin_api_token")

echo "[crowdin-push.sh] Adding custom sources from CustomSources/ to en/"
cp -r CustomSources/* en/

crowdin push
