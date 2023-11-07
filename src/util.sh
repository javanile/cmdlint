
capture_output() {
    local command
    local tmp_file

    command=$1
    tmp_file=$(mktemp -u)

    "${command}" > "${tmp_file}.out" 2> "${tmp_file}.err"

    echo "${tmp_file}"
}

output_is_usage_message() {
    local output_file

    output_file=$1

    if grep 'Options:' "${output_file}" > /dev/null 2>&1; then
        return 0
    fi

    return 1
}