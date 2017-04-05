DATASETS=("apple2orange" "facades_photo2label" "map2sat" "orange2apple" "style_cezanne" "style_ukiyoe"  "summer2winter_yosemite" "zebra2horse" "facades_label2photo" "horse2zebra" "monet2photo" "sat2map" "style_monet" "style_vangogh" "winter2summer_yosemite")

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
