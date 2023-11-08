
cmdlint_rule_000() {
    local command

    command=$1

    if ! command -v "${command}" &> /dev/null; then
        raise_error R000 "${command}" "Command '${command}' not found"
    fi
}
