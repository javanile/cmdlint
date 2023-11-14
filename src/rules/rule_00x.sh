
cmdlint_rule_00x() {
  local command
  local exit_code

  command=$1
  exit_code=0

  if ! command -v "${command}" >/dev/null 2>&1; then
    raise_error R000 "${command}" "Missing '${command}' on the system"
    exit_code=1
  fi

  return ${exit_code}
}
