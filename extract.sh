#!/usr/bin/env bash

cd $(dirname $0)

DEST=Extract
GAMEDIR=/home/Games/SteamLibrary/steamapps/common/RimWorld
LANGN=() # Language name, LANG is a system variable

log() {
	printf "$*\n"
}

for arg in "$@"; do
	case "$1" in
		--lang)
			LANGN+=("$2")
			log "Searching for language $LANGN"
			shift 2;;
		--gamedir)
			GAMEDIR="$2"
			log "Searching in game directory $GAMEDIR"
			shift 2;;
		--dest)
			DEST="$2"
			log "Extracting in $DEST"
			shift 2;;
		--all)
			for f in "$GAMEDIR"/Data/Core/Languages/*.tar; do
			  name=$(basename "$f" .tar)
			  LANGN+=("$name")
			done
			log "Selecting all languages from «$GAMEDIR/Data/Core/Languages»"
			shift;;
		--help)
			log "Цей скрипт автоматично видобуває файли вказаної мови (окрім English) з усіх доповнень у грі. 

Використання: 	extract.sh --game ТЕКА_ГРИ МОВИ
	або:	extract.sh --game ТЕКА_ГРИ --all

Приклад:
./extract.sh --game \"/home/Games/SteamLibrary/steamapps/common/RimWorld\" \"Ukrainian (Українська)\" \"Polish (Polski)\"

Команди:
	--help	- показати це повідомленян
	--game	- вказати директорію гри
	--dest	- куди потрібно видобути мову
	--all	- видобути всі мови"
			shift;;
		*)
			LANGN+=("$1")
			shift;;
	esac
done



if [ -z "$LANGN" ]; then
	log "You have to specify language name, with --lang \"Ukrainian (Українська)\""
	exit 1
fi
if [ -z "$GAMEDIR" ]; then
	log "You have to specify the game directory, with --game \"/home/Games/SteamLibrary/steamapps/common/RimWorld\""
	exit 2
fi

if [ ! -d "$GAMEDIR/Data" ]; then
	log "Game directory doesn't exist or is not valid, must contain a Data/ directory inside"
	exit 2
fi

for lang in "${LANGN[@]}"; do
	for dlc in "$GAMEDIR"/Data/*/; do
		[ ! -f "$dlc"/Languages/"$lang.tar" ] && log "No file «$lang.tar» in "$dlc"/Languages" && continue
		log "Extracting files from $dlc/$lang.tar"
		mkdir -p "$DEST"/"$lang"/"$(basename "$dlc")"/
		tar -xf "$dlc"/Languages/"$lang.tar" -C "$DEST"/"$lang"/"$(basename "$dlc")"/
	done
done
