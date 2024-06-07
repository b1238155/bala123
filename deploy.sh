#!/bin/bash

# Build the project
echo "Building the project..."
python3 setup.py build

# Run tests
echo "Running tests..."
pytest

# Deploy the project
echo "Deploying the project..."
# Add deployment commands here

# For example, you might want to copy the built files to a server
# using scp command
echo "Copying files to the server..."
scp -r  ubuntu@13.127.199.150:/home/ubuntu

# Or, you might want to restart a server or service
echo "Restarting server..."
ssh ubuntu@13.127.199.150 "sudo systemctl restart service"

# You can add any other deployment commands relevant to your project here
# Ensure you replace placeholders with actual paths, server details, and commands
