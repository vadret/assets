#!/bin/bash

aspects=(
	drawable-mdpi
	drawable-hdpi
	drawable-xhdpi
	drawable-xxhdpi
	drawable-xxxhdpi
)

#output="../app/src/main/res"
output="dist/"
dim=(48 96 144 192 512)

echo "Exporting icons to png ..."
for icon in src/wsymb2*.svg; do
    filename=$(basename ${icon} .svg)
    for res in ${dim[*]}; do
    	case $res in
    		48)
				inkscape -f ${icon} --export-id ${filename} -w ${res} -h ${res} -e ${output}/drawable-mdpi/${filename}.png
			;;
			96)
				inkscape -f ${icon} --export-id ${filename} -w ${res} -h ${res} -e ${output}/drawable-hdpi/${filename}.png
			;;
			144)
				inkscape -f ${icon} --export-id ${filename} -w ${res} -h ${res} -e ${output}/drawable-xhdpi/${filename}.png
			;;
			192)
				inkscape -f ${icon} --export-id ${filename} -w ${res} -h ${res} -e ${output}/drawable-xxhdpi/${filename}.png
			;;
			512)
				inkscape -f ${icon} --export-id ${filename} -w ${res} -h ${res} -e ${output}/drawable-xxxhdpi/${filename}.png
			;;
		esac
    done
done

#echo "Optimizing png's!"

#for f in $output/**/*.png; do
#    optipng -o 2 $f
#done
