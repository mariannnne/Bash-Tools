#!/bin/bash

# This script will move and rename files
#
# Marianne 2017

# STUDY-SPECIFIC VARIABLES:
current_dir="/Volumes/engram/Users/marianne/Desktop/2017_ImaginedExtinction/subjects"
new_dir_1="/Volumes/engram/Users/marianne/Desktop/2017_ImaginedExtinction/data/Acq_CS_plus"
new_dir_2="/Volumes/engram/Users/marianne/Desktop/2017_ImaginedExtinction/data/Acq_CS_minus"
move_image_1="con_0001.*"
move_image_2="con_0002.*"

###########################################################
##### YOU SHOULD NOT NEED TO EDIT ANYTHING BELOW THIS #####
###########################################################

# allow globbing
shopt -s extglob

mkdir ${new_dir_1}
mkdir ${new_dir_2}

#get preprocessed structural, move to appropriate folder
for file in ${current_dir}/IE*; do
	cd $file
	subid=${PWD##*/}  #goes by ursi number
	new_name_1=${subid}${move_image_1}
	new_name_2=${subid}${move_image_2}
	echo "copying $new_name_1 data..."
	cp ./${move_image_1} ${new_dir_1}
	cp ./${move_image_2} ${new_dir_2}
	cd ${new_dir_1}
	mv ${move_image_1} ${new_name_1}
	cd ${new_dir_2}
	mv ${move_image_2} ${new_name_2}
done