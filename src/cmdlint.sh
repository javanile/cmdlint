
module rules

cmdlint() {
    local command
    local exit_code

    command=$1

    cmdlint_rule_00x "${command}"
    exit_code=$?

    cmdlint_rule_01x "${command}"
    exit_code=$?

    cmdlint_rule_02x "${command}"
    exit_code=$?

    return ${exit_code}
}
