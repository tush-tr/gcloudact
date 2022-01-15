#!/bin/bash
apt update
# Download the latest runner package
curl -o actions.tar.gz --location "https://github.com/actions/runner/releases/download/v2.263.0/actions-runner-linux-x64-2.263.0.tar.gz"
# create folders
mkdir /runner
mkdir /runner-tmp
# Extract the installer
tar -zxf actions.tar.gz --directory /runner
rm -f actions.tar.gz
# Install dependencies
/runner/bin/installdependencies.sh
# Create a registration token using Github REST API v3
temp=$(curl -XPOST \
-H "Accept: application/vnd.github.v3+json" \
-H "authorization: Bearer ${GITHUB_ACCESS_TOKEN}" \
"https://api.github.com/repos/${GITHUB_USERNAME}/${GITHUB_REPO_NAME}/actions/runners/registration-token")
# Extract token value from the response
ACTIONS_RUNNER_INPUT_TOKEN=$(echo $temp | grep "token" | awk '{print $3}'| awk -F , '{print $1 }' | sed 's/"//g')
# Configure the runner
RUNNER_ALLOW_RUNASROOT=1 /runner/config.sh --unattended --replace --work "/runner-tmp" --url https://github.com/${GITHUB_USERNAME}/${GITHUB_REPO_NAME} --token "$ACTIONS_RUNNER_INPUT_TOKEN" --labels gce-runner
# install and start runner service
cd /runner || exit
./svc.sh install
./svc.sh start