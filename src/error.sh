
raise_error() {
    echo "--------------------------------------------------------------"
    echo " $1 | Command: $2"
    echo "      |   Error: $3"
}

highlight_line() {
    local line

    line=$1
    line_prefix=$2
    line_highlight=$(echo "$3" | sed 's/./^/g')
    line_message=$4

    echo
    echo -e "$line"
    echo "${line_prefix}${line_highlight} ${line_message}"
}
