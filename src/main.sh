
module cmdlint
module error
module util
module validator

usage() {
  echo "====[ THE COMMAND LINTER ]===="
  echo "Conduct multiple checks on the output"
  echo "of the COMMAND in typical shell use cases."
  echo
  echo "Usage:   cmdlint [OPTION] [COMMAND]"
  echo
  echo "Options:"
  echo "  --ignore RULE_LIST    Ignore rules from the list (eg. R001,R002)"
  echo "  --help                Display this help message"
  exit
}

main() {
  local command
  local ignore_rules

  [ -z "$1" ] && usage
  [ $# -eq 0 ] && usage
  [ "$1" = "--help" ] && usage
  if [ "$1" = "--ignore" ]; then
    ignore_rules=$2
    shift 2
  fi

  command="$1"

  echo "--------------------------------------------------------------"
  echo " Analyzing: ${command}"
  echo "  Ignoring: ${ignore_rules}"

  cmdlint "${command}" "${ignore_rules}" && true

  if [ $? -eq 1 ]; then
    echo "Exit with analysis error"

    exit 1
  fi

  echo "    Result: success"
  echo "--------------------------------------------------------------"
}
