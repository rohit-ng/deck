#!/bin/bash

# Check if input is provided
if [ -z "$1" ]; then
  echo "No input provided"
  exit 1
fi

# Parse the environment from the input
environments=$(echo $1 | jq -r '.[] | split("/") | .[1]' | sort | uniq)

# Check if jq parsing was successful
if [ -z "$environments" ]; then
  echo "Failed to parse environment"
  exit 1
fi

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

echo "Assuming role $ROLE_ARN for account $environments"
echo "role_arn=$ROLE_ARN" >> $GITHUB_OUTPUT
