#!/bin/bash
set -e

echo "Installing curl"

which curl &> /dev/null || apt-get update && apt-get install -y curl

echo "Installing Foundry toolkit"

arch=$(uname -m)
if [[ $arch == "x86_64" ]]; then
  arch="amd64"
elif [[ $arch == "aarch64" ]]; then
  arch="arm64"
else
  echo "Unsupported architecture: $arch"
  exit 1
fi

curl -L https://github.com/foundry-rs/foundry/releases/download/nightly/foundry_nightly_linux_$arch.tar.gz --output foundry-nightly.tar.gz
tar -xzf foundry-nightly.tar.gz

mv forge /usr/local/bin/
mv cast /usr/local/bin/
mv anvil /usr/local/bin/