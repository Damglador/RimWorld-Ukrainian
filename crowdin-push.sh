#!/usr/bin/env bash

cd $(dirname $0)

cp -r CustomStrings/* en/

crowdin push
