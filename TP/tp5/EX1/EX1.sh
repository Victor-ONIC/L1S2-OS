#!/bin/bash

if [ $# -ne 1 ]; then
    echo "ERREUR: il ne doit y avoir qu'un seul argument."
    exit 1
fi

if [ ! -f "index.html" ]; then
    echo "Fichier HTML inexistant."
    touch index.html
fi

for i in img/*\ *; do
    mv "$i" "${i// /-}" 2> /dev/null
done

html="<!DOCTYPE html>\n<html lang=\"fr\">\n<head>\n\t<meta charset=\"UTF-8\">\n\t<title>TP5</title>\n</head>\n<body>\n</body>\n</html>"
for i in $(ls $1); do
    if [ -f "img/VIGNETTE$(echo $i | cut -f1 -d".").png" ]; then
        continue
    fi
    echo $i
    convert img/$i -resize 128x128\! img/VIGNETTE$(echo $i | cut -f1 -d".").png
    html=$(echo -e "$html" | sed "s/<body>/&\n\t<img src=\".\/img\/VIGNETTE$(echo $i | cut -f1 -d".").png\" onclick=\"this.src='.\/img\/$i'\"><br>/")
done

echo -e "$html" > index.html
