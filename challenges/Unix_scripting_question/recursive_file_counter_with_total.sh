# -----------------------------------------------------------------
# Counts all *.py files in current directory and all subdirectories,
# and returns aggregate total of lines
# -----------------------------------------------------------------

# ignore whitespace in file names
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# set initial total_lines value
let total_lines=0

function print_lines_per_file_in_directory {

  # for each file in current directory with this particular extension,
  for file in *.py; do
    # increment total_lines by number of lines in $file
    total_lines=$((total_lines + $(cat $file | wc -l)))

    # calculates $(cat $file | wc -l) again because it echoes out with nicer formatting :)
    # print the file name and counted lines
    echo "$(cat $file | wc -l) lines: $file"
  done

  # for each subdirectory in current directory, run this script recursively
  for D in *; do
    if [ -d "${D}" ]; then
        # if current item is a directory, cd into it, run script, then cd out
        cd $D
        print_lines_per_file_in_directory $D total_lines_in_current_dir
        cd ../
    fi
  done

  # return to continue recursion
  return 0
}

# call the function to run
print_lines_per_file_in_directory

echo "--------------------------------"
echo "Total:  $total_lines lines"

# restore spaces
IFS=$SAVEIFS

exit
