size=$(identify -format "%[fx:w]x%[fx:h]" $1)
convert -resize $size -quality 50 $1 c_$1
