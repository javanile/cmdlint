
module cmdlint
module error
module util

usage() {
    echo "The command linter"
    echo "  Usage: cmdlint [COMMAND]"
    echo "  Conduct multiple checks on the output of the COMMAND in typical shell use cases."
    exit
}

main() {
    [ -z "$1" ] && usage
    [ $# -eq 0 ] && usage
    [ "$1" = "--help" ] && usage

    local command

    command=$1

    echo "Analyzing: ${command}"

    cmdlint "${command}"
}
