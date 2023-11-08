
cmdlint_rule_000() {
    local command

    command=$1

    if ! command -v "${command}" >/dev/null 2>&1; then
        raise_error R000 "${command}" "Missing '${command}' on the system"
    fi
}
