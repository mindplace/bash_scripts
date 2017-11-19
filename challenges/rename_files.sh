# ignore whitespace in file names
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function rename_file_extensions_in_directory {

  # for each file in current directory with this particular extension,
  for file in *.rb; do
    # print the file name and counted lines
    mv "$file" "`basename "$file" .rb`.py"
  done

  # for each subdirectory in current directory, run this script recursively
  for D in *; do
    if [ -d "${D}" ]; then
        cd $D
        # echo "Now inside '$D':"
        print_lines_per_file_in_directory $D
        cd ../
    fi
  done

  # return to continue recursion
  return 0
}

rename_file_extensions_in_directory *

# restore spaces
IFS=$SAVEIFS

exit
