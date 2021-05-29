#!/bin/bash
###################################################################
#																  #
#			Find files & execute md5 evaluation script			  #
#					Version 0.1 - 29/05/2021					  #
#																  #
###################################################################
usage() { echo "Usage: ./main.sh -p PATH -o OUTPUTNAME"; exit; }

#ARGUMENT CHECK
while getopts ":p:o:" opts; do
	case "${opts}" in
		p) CUSTOMPATH=${OPTARG}
		;;
        o) OUTPUTNAME=${OPTARG}
		;;
		*) 
			usage
		;;
    esac
done

find "${CUSTOMPATH}" -type f -exec ./eval.sh -f "{}" -o $OUTPUTNAME \;
#find /home/geeh/Documents/GitHub/MD5Er/Test/ -type f -exec ./eval.sh -f "{}" \;