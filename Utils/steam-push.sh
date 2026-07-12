#!/usr/bin/env bash

ITEM_VDF="$(mktemp)"
STEAM_USERNAME="$(pass steam/main/username)"
STEAM_PASSWORD="$(pass steam/main)"

APPID=294100
ITEMID=3531401512
SOURCEPATH="$(realpath "$(dirname "$0")/Mod/")"

cat << EOF > "$ITEM_VDF"
"workshopitem"
{
  "appid" "${APPID}"
  "contentfolder" "${SOURCEPATH}"
  "changenote" "${INPUT_CHANGENOTE}"
  "publishedfileid" "${ITEMID}"
}
EOF

cat "$ITEM_VDF"

# Attempt loop
ATTEMPTS_CURRENT=0
ATTEMPTS_MAX=3
IS_SUCCESSFUL=0

while [[ ${ATTEMPTS_CURRENT} -lt ${ATTEMPTS_MAX} ]]; do
    echo "Attempt $((ATTEMPTS_CURRENT+1)) of ${ATTEMPTS_MAX}..."
    steamcmd +@ShutdownOnFailedCommand 1 +login "${STEAM_USERNAME}" "${STEAM_PASSWORD}" "$(keepassxc-cli show -t ~/.local/share/pass/keepass.kdbx Steam)" +workshop_build_item "$ITEM_VDF" +quit

    if [[ $? -eq 0 ]]; then
        IS_SUCCESSFUL=1
        break
    fi

    ATTEMPTS_CURRENT=$((ATTEMPTS+1))
    echo "Attempt ${ATTEMPTS_CURRENT} failed. Retrying..."
    sleep 2
done

if [[ ${IS_SUCCESSFUL} -eq 1 ]]; then
  exit 0
fi

echo "All ${ATTEMPTS_MAX} attempts failed."
echo 'Showing stderr.txt:'
cat ~/.steam/steam/logs/stderr.txt
echo
echo 'Showing workshop_log.txt:'
cat ~/.steam/steam/logs/workshop_log.txt
exit 2
