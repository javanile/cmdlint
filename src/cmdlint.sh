
module rules

cmdlint() {
    local command

    command=$1

    cmdlint_rule_001 "${command}"
}