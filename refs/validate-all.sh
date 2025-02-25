#!/bin/bash

run_unix_cmd() {
    # $1 is the line number
    # $2 is the cmd to run
    # $3 is the expected exit code
    output=$($2 2>&1)
    exit_code=$?
    if [[ $exit_code -ne $3 ]]; then
        printf "failed (incorrect exit status code) on line $1.\n"
        printf "  - exit code: $exit_code (expected $3)\n"
        printf "  - command: $2\n"
        if [[ -z $output ]]; then
            printf "  - output: <none>\n\n"
        else
            printf "  - output: <starts on next line>\n$output\n\n"
        fi
        exit 1
    fi
}

DATE=$(date +%Y-%m-%d)

# Validation of the "quic-client" module

printf "Testing ietf-quic-client.yang (pyang)..."
command="pyang -Werror --ietf --max-line-length=72 -p .. ../ietf-quic-client\@*.yang"
run_unix_cmd $LINENO "$command" 0
command="pyang --canonical ../ietf-quic-common\@*.yang ../ietf-quic-client\@*.yang"
run_unix_cmd $LINENO "$command" 0
printf "ok.\n"

printf "Testing ietf-quic-client.yang (yanglint)..."
command="yanglint ietf-netconf-acm@2018-02-14.yang ietf-tls-common@2024-10-10.yang ietf-tls-client@2024-10-10.yang ietf-udp-client@2024-10-15.yang ../ietf-quic-client\@*.yang"
run_unix_cmd $LINENO "$command" 0
printf "ok.\n"

# Validation of the "quic-server" module

printf "Testing ietf-quic-server.yang (pyang)..."
command="pyang -Werror --ietf --max-line-length=72 -p .. ../ietf-quic-server\@*.yang"
run_unix_cmd $LINENO "$command" 0
command="pyang --canonical ../ietf-quic-common\@*.yang ../ietf-quic-server\@*.yang"
run_unix_cmd $LINENO "$command" 0
printf "ok.\n"

printf "Testing ietf-quic-server.yang (yanglint)..."
command="yanglint ietf-tls-common@2024-10-10.yang ietf-tls-server@2024-10-10.yang ietf-udp-server@2024-10-15.yang ../ietf-quic-server\@*.yang"
run_unix_cmd $LINENO "$command" 0
printf "ok.\n"
