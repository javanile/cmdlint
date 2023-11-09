
raise_error() {
    echo "--------------------------------------------------------------"
    echo " $1 | Command: $2"
    echo "      |   Error: $3"
}

highlight_line() {
    echo
    echo -e "$1"
    echo "^^^^"
}
