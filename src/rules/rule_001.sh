
cmdlint_rule_001() {
    local command
    local output

    command=$1

    output=$(capture_output "${command}")

    cat "${output}.out"

    if output_is_usage_message "${output}.out"; then
        if ! grep '--help' "${output}.out" >/dev/null 2>&1; then
            raise_error R001 "${command}" "Missing '--help' on usage message"
        fi
    fi
}
