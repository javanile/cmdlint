
usage() {
    echo "The command linter"
    echo "  Usage: cmdlint [COMMAND]"
    echo "  Run check on output of COMMAND in common shell use cases."
    exit
}

main() {
  [ $# -eq 0 ] && usage
  [ "$1" = "--help" ] && usage

  echo "Hello World!"
}
