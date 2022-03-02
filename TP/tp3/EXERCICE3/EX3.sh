#! bin/bash

# ceci est le deuxième version de mon script, j'ai inclu la première afin de montrer que ces lignes ne viennent pas de nulle part.

base="\n\t<etudiant>\n\t\t<surname></surname>\n\t\t<name></name>\n\t\t<birthday></birthday>\n\t\t<courses>\n\t\t\t<course></course>\n\t\t\t<course></course>\n\t\t</courses>\n\t</etudiant>\n"
echo "<etudiants>" >> fichier.xml
for i in $(cat etudiant.txt) ; do
    new="$base"
    new=$(echo -e "$new" | sed "s/<surname>/&$(echo $i | cut -f1 -d":")/")
    new=$(echo -e "$new" | sed "s/<name>/&$(echo $i | cut -f2 -d":")/")
    new=$(echo -e "$new" | sed "s/<birthday>/&$(echo $i | cut -f3 -d":")/")
    new=$(echo -e "$new" | sed -e "0,/<course><\/course>/{s/<course><\/course>/<course>$(echo $i | cut -f4 -d":" | cut -f1 -d";")<\/course>/;}")
    new=$(echo -e "$new" | sed "s/<course><\/course>/<course>$(echo $i | cut -f4 -d":" | cut -f2 -d";")<\/course>/")
    echo -e "$new" >> fichier.xml
done
echo -e "\n</etudiants>" >> fichier.xml
