#!/bin/bash

# Check if input is provided
if [ -z "$1" ]; then
    echo "No input provided"
    exit 1
fi

# Parse the environment from the input
environment=$(echo $changed_dirs | jq -r '.[] | split("/") | .[0]' | sort | uniq)

# Determine the role ARN based on the environment
for environment in $environments; do
    case "$environment" in
    dev)
        ROLE_ARN=${DEV_GH_ROLE}
        ;;
    *)
        echo "Unknown environment $environment"
        exit 1
        ;;
    esac
done

echo "Assuming role $ROLE_ARN for account $environment"
echo "role_arn=$ROLE_ARN" >>$GITHUB_OUTPUT
