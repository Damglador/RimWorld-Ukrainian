#!/usr/bin/env bash

export CROWDIN_PROJECT_ID=295257
[ -z CROWDIN_PERSONAL_TOKEN ] && export CROWDIN_PERSONAL_TOKEN=""

cd $(dirname $0)

# Завантажити переклад з Crowdin (потрібен CROWDIN_PERSONAL_TOKEN менеджера проєкту)
crowdin download

# Оновити мод
cp -r uk/* Mod/
