#!/bin/bash

# Check if input is provided
if [ -z "$1" ]; then
  echo "No input provided"
  exit 1
fi

# Parse the environment from the input
environment=$(echo $1 | jq -r '.[] | split("/") | .[0]' | sort | uniq)

# Check if jq parsing was successful
if [ -z "$environment" ]; then
  echo "Failed to parse environment"
  exit 1
fi

# Determine the role ARN based on the environment
case "$environment" in
  dev)
    ROLE_ARN=${DEV_GH_ROLE}
    ;;
  *)
    echo "Unknown environment $environment"
    exit 1
    ;;
esac

echo "Assuming role $ROLE_ARN for account $environment"
echo "role_arn=$ROLE_ARN" >> $GITHUB_OUTPUT
