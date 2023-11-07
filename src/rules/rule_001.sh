
cmdlint_rule_001() {
    local command
    local output

    command=$1

    output=$(capture_output "${command}")

    cat $output.out
}
