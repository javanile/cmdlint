
module rules

cmdlint() {
    local command

    command=$1

    cmdlint_rule_00x "${command}"
    cmdlint_rule_01x "${command}"
    cmdlint_rule_02x "${command}"
}
