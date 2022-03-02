#! bin/bash

nb_etudiants=`cat etudiant.txt | wc -l`
base="\n\t<etudiant>\n\t\t<surname></surname>\n\t\t<name></name>\n\t\t<birthday></birthday>\n\t\t<courses>\n\t\t\t<course></course>\n\t\t\t<course></course>\n\t\t</courses>\n\t</etudiant>\n"

echo "<etudiants>" >> fichier.xml

for i in `seq 1 1 $nb_etudiants`
do
    surname=`head -n $i etudiant.txt | tail -n 1 | cut -f 1 -d ":"`
    name=`head -n $i etudiant.txt | tail -n 1 | cut -f 2 -d ":"`
    birthday=`head -n $i etudiant.txt | tail -n 1 | cut -f 3 -d ":"`
    course1=`head -n $i etudiant.txt | tail -n 1 | cut -f 4 -d ":" | cut -f 1 -d ";"`
    course2=`head -n $i etudiant.txt | tail -n 1 | cut -f 4 -d ":" | cut -f 2 -d ";"`

    new="$base"
    new=`echo -e "$new" | sed "s/<surname>/&$surname/"`
    new=`echo -e "$new" | sed "s/<name>/&$name/"`
    new=`echo -e "$new" | sed "s/<birthday>/&$birthday/"`
    new=`echo -e "$new" | sed -e "0,/<course><\/course>/{s/<course><\/course>/<course>$course1<\/course>/;}"`
    new=`echo -e "$new" | sed "s/<course><\/course>/<course>$course2<\/course>/"`

    echo -e "$new" >> fichier.xml
done

echo -e "\n</etudiants>" >> fichier.xml
