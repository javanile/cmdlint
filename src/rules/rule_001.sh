
cmdlint_rule_001() {
    local command
    local output

    command=$1

    output=$(capture_output "${command}")

    if output_is_usage_message "${output}.out"; then
        echo "A"
    else
        echo "B"
    fi
}
