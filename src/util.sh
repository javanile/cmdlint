
capture_output() {
    local command
    local tmp_file

    command=$1
    tmp_file=$(mktemp -u)

    ${command} > "${tmp_file}.out" 2> "${tmp_file}.err" && true

    echo "${tmp_file}"
}

extract_subcommands() {
  local output_file
  local capture_subcommands
  local subcommand

  output_file=$1

  while IFS=$'\n' read -r line; do
    [ -z "${line// }" ] && continue
    if [ "${line}" = "Commands:" ]; then
      capture_subcommands=true
    elif [ "${capture_subcommands}" = true ]; then
      if echo "${line}" | grep -q "^[[:space:]]"; then
        subcommand=$(echo "${line}" | awk '{print $1}')
        echo "${subcommand}"
      else
        capture_subcommands=false
      fi
    fi
  done < "${output_file}"
}

extract_usage_lines() {
  local output_file
  local capture_usage_lines
  local usage_line

  output_file=$1

  while IFS=$'\n' read -r line; do
    [ -z "${line// }" ] && continue
    if [ "${line}" = "Usage:" ]; then
      capture_usage_lines=true
    elif [ "${capture_usage_lines}" = true ]; then
      if echo "${line}" | grep -q "^[[:space:]]"; then
        echo "${line}"
      else
        capture_usage_lines=false
      fi
    fi
  done < "${output_file}"
}