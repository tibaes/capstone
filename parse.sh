#!/bin/bash

echo "path, target" > dataset.csv
for img in `find ./data/ -iname "*.png"`
do
    txt=`echo $img | sed -e 's/.png/.txt/'`
    class=`grep -i "class" $txt | cut -d" " -f2`
    echo "$img, $class" >> dataset.csv
done