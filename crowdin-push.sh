#!/usr/bin/env bash

cd $(dirname $0)

cp -r CustomSources/* en/

crowdin push
