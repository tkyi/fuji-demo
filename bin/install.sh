#!/bin/bash

set -e

echo "Install npm modules.."
npm install

echo "Install jq.."
apt-get update
apt-get -y install jq