#!/bin/bash
###################################################################
#																  #
#	Execute md5 evaluation script, used by eval_launcher.sh		  #
#					Version 0.1 - 29/05/2021					  #
#																  #
###################################################################
usage() { echo "Usage: ./eval.sh -f FILENAME -o OUTPUTNAME"; exit; }

#ARGUMENT CHECK
while getopts ":f:o:" opts; do
	case "${opts}" in
		f) FILENAME=${OPTARG}
		;;
        o) OUTPUTNAME=${OPTARG}
		;;
		*) 
			usage
		;;
    esac
done

openssl dgst -md5 "${FILENAME}" >> ${OUTPUTNAME}