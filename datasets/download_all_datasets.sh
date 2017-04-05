#!/bin/bash
DATASETS=("ae_photos" "apple2orange" "summer2winter_yosemite" "horse2zebra" "monet2photo" "cezanne2photo" "ukiyoe2photo" "vangogh2photo" "maps" "cityscapes" "facades" "iphone2dslr_flower" "ae_photos")
for FILE in "${DATASETS[@]}"
	do
	URL=https://people.eecs.berkeley.edu/~taesung_park/CycleGAN/datasets/$FILE.zip
	ZIP_FILE=./datasets/$FILE.zip
	TARGET_DIR=./datasets/$FILE/
	wget --no-check-certificate -N $URL -O $ZIP_FILE
	mkdir $TARGET_DIR
	unzip $ZIP_FILE -d ./datasets/
	rm $ZIP_FILE
done
