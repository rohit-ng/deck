#!/bin/bash

# Check if input is provided
if [ -z "$1" ]; then
    echo "No input provided"
    exit 1
fi

environment=$(echo $1 | jq -r '.[] | split("/") | .[0]' | sort | uniq)

case "$environment" in
dev)
    ROLE_ARN=${DEV_GH_ROLE}
    ;;
*)
    echo "Unknown account $environment"
    exit 1
    ;;
esac

echo "Assuming role $ROLE_ARN for account $environment"
echo "role_arn=$ROLE_ARN" >>$GITHUB_OUTPUT
