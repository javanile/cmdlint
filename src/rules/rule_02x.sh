
cmdlint_rule_02x() {
    local command
    local output

    command=$1

    output=$(capture_output "${command}")

    if is_output_a_usage_message "${output}.out"; then
      if has_output_subcommands "${output}.out"; then
         extract_subcommands "${output}.out" | while read -r subcommand; do
           cmdlint_rule_01x "${command} ${subcommand}"
         done
      fi
    fi
}
