# -----------------------------------------------------------------
# Counts all *.py files in current directory and all subdirectories
# -----------------------------------------------------------------

# ignore whitespace in file names
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function print_lines_per_file_in_directory {

  # for each file in current directory with this particular extension,
  for file in *.py; do
    # print the file name and counted lines
    echo "$(cat $file | wc -l) lines: $file"
  done

  # for each subdirectory in current directory, run this script recursively
  for D in *; do
    if [ -d "${D}" ]; then
        # if current item is a directory, cd into it, run script, then cd out
        cd $D
        print_lines_per_file_in_directory $D
        cd ../
    fi
  done

  # return to continue recursion
  return 0
}

# call the function to run
print_lines_per_file_in_directory

# restore spaces
IFS=$SAVEIFS

exit
