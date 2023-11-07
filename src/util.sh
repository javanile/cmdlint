
capture_output() {
    local command
    local tmp_file

    command=$1
    tmp_file=$(mktemp -u)

    "${command}" > "${tmp_file}.out" 2> "${tmp_file}.err"

    echo "${tmp_file}"
}
