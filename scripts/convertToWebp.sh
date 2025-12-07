#!/bin/bash

set -e 

ls -l
read -p "Extension: " extension

case $extension in
	jpeg)
		for file in *.jpeg; do
			ffmpeg -i "$file" -c:v libwebp -lossless 1 "${file%.jpeg}.webp"
		done
		rm *.jpeg
		;;
	png)
		for file in *.png; do
			ffmpeg -i "$file" -c:v libwebp -lossless 1 "${file%.png}.webp"
		done
		rm *.png
		;;

	jpg)
		for file in *.jpg; do
			ffmpeg -i "$file" -c:v libwebp -lossless 1 "${file%.jpg}.webp"
		done
		rm *.jpg
		;;

	*)
		echo "unknown"
		;;
esac
