#!/bin/bash

## declare an array search keywords here
declare -a array=("cat")

# get length of an array
arraylength=${#array[@]}

# use for loop to read all values and indexes
for (( i=1; i<${arraylength}+1; i++ ));
do
  echo $i " / " ${arraylength} " : " ${array[$i-1]}
  url="any available url which supports"
  response=`curl "${url}?word=${array[$i-1]}" |\
	 jq '._embedded.vector | .[].thumb_link'`

	echo $response
	# wget http://images.cdn3.stockunlimited.net/clipart/cat_1433453.jpg
	# for link in $response ; do
	# 	echo $link
	# 	wget $link
	# done
	wget -r -i $response
# 	while read -r url; do
#     wget $url
# done < $response
	
done
