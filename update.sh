#!/usr/bin/env bash

export CROWDIN_PROJECT_ID=295257
[ -z CROWDIN_PERSONAL_TOKEN ] && export CROWDIN_PERSONAL_TOKEN=""

MOD_DIR=Mod

cd $(dirname $0)

# Завантажити переклад з Crowdin (потрібен CROWDIN_PERSONAL_TOKEN менеджера проєкту)
crowdin download

# Дати файли моду
mkdir -p Mod/CrowdinFiles && cp -r uk/* "$MOD_DIR"/CrowdinFiles

# Наказати моду оновитися
[ ! -x "$MOD_DIR"/build.sh ] && chmod u+x "$MOD_DIR"/build.sh
"$MOD_DIR"/build.sh
