#!/bin/bash
###################################################################
#																  #
# Main script file: launch eval_launcher -> eval, move duplicates #
#					Version 0.1 - 29/05/2021					  #
#																  #
###################################################################

usage() { echo "Usage: ./compare.sh -p FOLDER1 FOLDER2"; exit; }

f_o_1="md5-1.txt"
f_o_2="md5-2.txt"

#ARGUMENT CHECK
while getopts ":p:" opts; do
	case "${opts}" in
		p) FOLDER1PATH=${OPTARG}
        shift $(($OPTIND - 1))
        FOLDER2PATH=$1
		;;
		*) 
			usage
		;;
    esac
done

#Launch eval_launcher.sh, generating md5 of files in the specified folders
#Ex (Relative paths): ./compare.sh -p 'Folder1' 'Folder (2)'
#Ex (Absolute & relative paths): ./compare.sh -p ~/Documents/GitHub/MD5Er/Folder1 '/home/binbasher/Documents/GitHub/MD5Er/Folder (2)'
./eval_launcher.sh -p "${FOLDER1PATH}" -o ${f_o_1} & #Don't wait to generate the second batch of MD5s
./eval_launcher.sh -p "${FOLDER2PATH}" -o ${f_o_2}

#Output files should be in the cwd anyway
#Get number of lines in file1
CTR_f1=$( wc -l ${f_o_1} | cut -d' ' -f1 )
CTR_f2=$( wc -l ${f_o_2} | cut -d' ' -f1 )

echo "Reading..."
for((CTR1=0; CTR1 < ${CTR_f1}; CTR1++)){

	read -r line
	#Make sure spaces in filenames don't break the code. Unfortunately this won't work with files or folder with '=' in them. Thank you, openssl developers.
	MD5_CTR1=$( echo "$line" | cut -d'=' -f2 | cut -d' ' -f2 ) 
	for((CTR2=0; CTR2 < ${CTR_f2}; CTR2++)){
		read -r line2
		MD5_CTR2=$( echo "$line2" | cut -d'=' -f2 | cut -d' ' -f2 )

		if [ ${MD5_CTR1} == ${MD5_CTR2} ]
		then
			#I separated these two lines with tabulator to make sure they can be *properly* formatted.
			echo "$line	matches	with	$line2"
			echo $line	=	$line2 >> matching.txt
		fi
	} < ${f_o_2}
} < ${f_o_1}

echo "Done. Check matching.txt"
