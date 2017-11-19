# -----------------------------------------------------------------
# Counts all *.py files in current directory
# -----------------------------------------------------------------

# ignore whitespace in file names
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# for each file in current directory with this particular extension,
for file in *.py; do
  # print the file name and counted lines
  echo "$(cat $file | wc -l) lines: $file"
done

# restore spaces
IFS=$SAVEIFS

exit
