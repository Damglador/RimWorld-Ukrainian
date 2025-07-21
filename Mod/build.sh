#!/usr/bin/env bash

cd $(dirname $0)

COMPONENTS=("Core" "Royalty" "Ideology" "Biotech" "Anomaly" "Odyssey")

echo "[build.sh] Updating Ukrainian Crowdin mod"

for DLC in "${COMPONENTS[@]}"; do
	LANG_DIR="$DLC/Languages/Ukrainian (Crowdin)"
	mkdir -p "$LANG_DIR"/
	cp -r CrowdinFiles/"$DLC"/* "$LANG_DIR"/
	
	for dir in Keyed DefInjected; do
	  find "$LANG_DIR/$dir" -type f -name '*.xml' | while read -r file; do
	  	if [[ "$file" != *_${DLC}.xml ]]; then
	        mv "$file" "${file%.xml}_${DLC}.xml"
	  	fi
	  done
	done
done
