#!/bin/bash

get_year() {
    echo $(echo $1 | cut -f3 -d"/" | cut -f1 -d"-")
}

get_genre() {
    echo $(echo $1 | cut -f3 -d"/" | cut -f2 -d"-")
}

get_album() {
    echo $(echo $1 | cut -f3 -d"/" | cut -f3 -d"-")
}

get_name() {
    echo $(echo $1 | cut -f3 -d"/" | cut -f4 -d"-")
}

source=$1
dest=$2

if [ ! -d "$source" ]; then
    echo "${source}: Dossier introuvable."
    exit 1
elif [ -z "$(ls -A $source)" ]; then
    echo "${source}: Dossier vide."
    exit 2
fi

for musique in $source/*; do
    dossier="$dest"
    [ ! -d $dossier ] && mkdir $dossier

    dossier=$(echo $dossier | sed "s;$dossier;&/$(get_genre $musique);")
    [ ! -d $dossier ] && mkdir $dossier

    dossier=$(echo $dossier | sed "s;$dossier;&/$(get_year $musique);")
    [ ! -d $dossier ] && mkdir $dossier

    dossier=$(echo $dossier | sed "s;$dossier;&/$(get_album $musique);")
    [ ! -d $dossier ] && mkdir $dossier

    titre=$source/$(get_name $musique)
    mv $musique $titre
    mv $titre $dossier

done
