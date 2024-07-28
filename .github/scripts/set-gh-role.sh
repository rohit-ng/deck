#!/bin/bash

# Check if input is provided
if [ -z "$1" ]; then
    echo "No input provided"
    exit 1
fi

changed_dirs=$1

# Convert the JSON array to a newline-separated list
changed_dirs_list=$(echo $changed_dirs | jq -r '.[]')

# Extract the environment names
environment=$(echo "$changed_dirs_list" | awk -F'/' '{print $1}' | sort | uniq)

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
