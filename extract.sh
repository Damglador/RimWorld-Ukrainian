#!/usr/bin/env bash

cd $(dirname $0)

DEST=Extract
GAMEDIR=/home/Games/SteamLibrary/steamapps/common/RimWorld

log() {
	printf "$*\n"
}

for arg in "$@"; do
	case "$1" in
		--lang)
			LANGN="$2"
			log "Searching for language $LANGN"
			shift;;
		--gamedir)
			GAMEDIR="$2"
			log "Searching in game directory $GAMEDIR"
			shift;;
		--dest)
			DEST="$2"
			log "Extracting in $DEST"
			shift;;
		--help)
			log "Цей скрипт автоматично видобуває файли вказаної мови (окрім English) з усіх доповнень у грі. 

Використання: 
./extract.sh --lang \"Ukrainian (Українська)\" --game \"/home/Games/SteamLibrary/steamapps/common/RimWorld\"

Команди:
	--help	- показати це повідомленян
	--game	- вказати директорію гри
	--lang	- вказати мову, яку потрібно видобути
	--dest	- куди потрібно видобути мову";;
		*) shift;;
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

for dlc in "$GAMEDIR"/Data/*/; do
	[ ! -f "$dlc"/Languages/"$LANGN.tar" ] && log "No file "$LANGN".tar in "$dlc"/Languages" && continue
	log "Extracting files from $dlc"
	mkdir -p "$DEST"/"$LANGN"/"$(basename "$dlc")"/
	tar -xvf "$dlc"/Languages/"$LANGN.tar" -C "$DEST"/"$LANGN"/"$(basename "$dlc")"/
done
