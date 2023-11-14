
module rules

cmdlint() {
    local command
    local ignore_rules
    local exit_code

    command=$1
    ignore_rules=$2
    exit_code=0

    cmdlint_rule_00x "${command}" "${ignore_rules}"
    exit_code=$?

    cmdlint_rule_01x "${command}" "${ignore_rules}"
    exit_code=$?

    cmdlint_rule_02x "${command}" "${ignore_rules}"
    exit_code=$?

    return ${exit_code}
}
