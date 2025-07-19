#!/usr/bin/env bash

cd $(dirname $0)

export CROWDIN_PROJECT_ID=295257

cp -r CustomSources/* en/

crowdin push
