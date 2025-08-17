#!/usr/bin/env bash

set -e
cd "$(dirname "$0")"

export CROWDIN_PROJECT_ID=295257
[ -z "$CROWDIN_PERSONAL_TOKEN" ] && export CROWDIN_PERSONAL_TOKEN=$(cat "$HOME/Documents/Vaults/Secrets/crowdin_api_token")

MOD_DIR=Mod

# Завантажити переклад з Crowdin (потрібен CROWDIN_PERSONAL_TOKEN менеджера проєкту)
crowdin download

# Дати файли моду
mkdir -p Mod/CrowdinFiles && cp -r uk/* "$MOD_DIR"/CrowdinFiles

# Commit updated translation to git
echo "[update.sh] Committing updated translation"
readarray -t files < <(git diff --staged --name-only)
git restore --staged .
git add uk/
git commit -m "Update translation"
[ ${#files[@]} -gt 0 ] && git add "${files[@]}" # Check if not empty avoid messages that I didn't commit anything

# Наказати моду оновитися
[ ! -x "$MOD_DIR"/build.sh ] && chmod u+x "$MOD_DIR"/build.sh
"$MOD_DIR"/build.sh