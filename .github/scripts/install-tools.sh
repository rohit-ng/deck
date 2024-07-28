#!/bin/bash

# Function to install unzip if not already installed
install_unzip() {
  if ! command -v unzip &> /dev/null; then
    sudo apt-get update -y &> /dev/null
    sudo apt-get install -y unzip &> /dev/null
  fi
}

# Function to install AWS CLI if not already installed
install_aws_cli() {
  if ! command -v aws &> /dev/null; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &> /dev/null
    unzip awscliv2.zip &> /dev/null
    sudo ./aws/install &> /dev/null
    rm awscliv2.zip &> /dev/null
  fi
}

# Function to install decK if not already installed
install_deck() {
  if ! command -v deck &> /dev/null; then
    curl -sL https://github.com/kong/deck/releases/download/v1.38.1/deck_1.38.1_linux_amd64.tar.gz -o deck.tar.gz &> /dev/null
    tar -xf deck.tar.gz -C /tmp &> /dev/null
    sudo cp /tmp/deck /usr/local/bin/ &> /dev/null
    rm deck.tar.gz &> /dev/null
  fi
}

# Main function to install all tools
main() {
  install_unzip
  install_aws_cli
  install_deck
}

# Execute main function
main
