
export CROWDIN_PROJECT_ID = 295257
export CROWDIN_PERSONAL_TOKEN ?= $(shell pass crowdin/api/rimworld)
MOD_DIR=Utils/Mod

help:
	@echo Available targets: update update-mod crowdin-push steam-push

.PHONY: update update-mod crowdin-push steam-push

update:
# Завантажити переклад з Crowdin (потрібен CROWDIN_PERSONAL_TOKEN менеджера проєкту)
	crowdin download
# Домішати переклади не з Crowdin
	cp -r CustomTranslations/* uk/

# Commit updated translation to git
	@echo "[update.sh] Committing updated translation"
# Unstage staged changes
	git restore --staged .
	git add uk/
# Check if not empty avoid messages that I didn't commit anything
	@if ! git diff --cached --quiet; then git commit -m "Update translation"; else echo No new changes updated; fi

update-mod:
	"${MOD_DIR}"/build.sh

crowdin-push:
	@echo "[crowdin-push] Adding custom sources from CustomSources/ to en/"
	cp -r CustomSources/* en/

	crowdin push

steam-push:
	./Utils/steam-push.sh
