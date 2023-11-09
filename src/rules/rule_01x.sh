
cmdlint_rule_00x() {
    local command
    local output

    command=$1

    output=$(capture_output "${command}")

    if is_output_a_usage_message "${output}.out"; then
        if ! grep "'--help'" "${output}.out" >/dev/null 2>&1; then
            raise_error R011 "${command}" "Missing '--help' on usage message"
        fi
    fi
}