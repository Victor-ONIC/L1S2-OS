#! bin/bash

d=`find $1 -maxdepth 1 -type d | wc -l`
f=`find $1 -maxdepth 1 -type f | wc -l`

echo "Il y a $d dossiers et $f fichiers."
