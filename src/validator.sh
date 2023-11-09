
is_output_a_usage_message() {
    local output_file

    output_file=$1

    if grep 'Options:' "${output_file}" > /dev/null 2>&1; then
        return 0
    fi

    return 1
}

has_output_subcommands() {
    local output_file

    output_file=$1

    if grep 'Commands:' "${output_file}" > /dev/null 2>&1; then
        return 0
    fi

    return 1
}
