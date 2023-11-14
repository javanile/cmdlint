
cmdlint_rule_01x() {
  local command
  local ignore_rules
  local output
  local usage_line
  local first_word
  local first_word_offset
  local exit_code

  command="$1"
  ignore_rules="$2"
  exit_code=0

  output=$(capture_output "${command}")

  if is_output_a_usage_message "${output}.out"; then
    if [ "${ignore_rules/R011/}" = "${ignore_rules}" ]; then
      if ! grep "'--help'" "${output}.out" >/dev/null 2>&1; then
        raise_error R011 "${command}" "Missing '--help' on usage message"
        exit_code=1
      fi
    fi
    if [ "${ignore_rules/R012/}" = "${ignore_rules}" ]; then
      echo "Checking usage lines for '${command}' ${ignore_rules/R012/} = ${ignore_rules} "
      if grep "^Usage:" "${output}.out" >/dev/null 2>&1; then
        IFS=$'\n'
        for usage_line in $(extract_usage_lines "${output}.out"); do
          echo "Usage: ${usage_line}"
          if ! echo "${usage_line}" | grep -q "^$command"; then
            raise_error R012 "${command}" "Usage line does not start with '${command}'"
            first_word=$(echo "${usage_line}" | awk '{print $1}')
            first_word_prefix=${usage_line%%$first_word*}
            highlight_line "Usage:\n${usage_line}" "${first_word_prefix}" "${first_word}" "Replace '${first_word}' with '${command}'"
            exit_code=1
          fi
        done
      fi
    fi
  fi

  return ${exit_code}
}
