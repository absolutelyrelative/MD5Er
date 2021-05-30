# MD5Er
 A Bash file/folder comparison tool that uses MD5

# Usage
./compare.sh -p FOLDER1 FOLDER2

## Examples
Example 1: (Relative paths): ./compare.sh -p 'Folder1' 'Folder (2)'

Example 2: (Absolute & relative paths): ./compare.sh -p ~/Documents/GitHub/MD5Er/Folder1 '/home/binbasher/Documents/GitHub/MD5Er/Folder (2)'


# Files
compare.sh : Main script file: launch eval_launcher -> eval, move duplicates.
eval_launcher.sh : Find files & execute md5 evaluation script.
eval.sh : Execute md5 evaluation script, used by eval_launcher.sh.