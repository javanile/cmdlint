
cmdlint_rule_02x() {
  local command
  local output
  local exit_code
  local subcommand
  local ignore_rules

  command="$1"
  ignore_rules="$2"
  exit_code=0

  output=$(capture_output "${command}")

  if is_output_a_usage_message "${output}.out"; then
    if has_output_subcommands "${output}.out"; then
      IFS=$'\n'
      for subcommand in $(extract_subcommands "${output}.out"); do
        cmdlint_rule_01x "${command} ${subcommand}" "${ignore_rules}" && true
        exit_code=$?
      done
    fi
  fi

  return ${exit_code}
}
