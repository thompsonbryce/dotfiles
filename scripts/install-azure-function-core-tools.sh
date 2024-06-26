#!/bin/bash

sudo curl https://api.github.com/repos/Azure/azure-functions-core-tools/releases/latest \
    | grep "browser_download_url.*.Azure.Functions.Cli.linux-x64.*.zip" \
    | grep -v "sha2" \
    | cut -d : -f 2,3  \
    | tr -d \" \
    | sudo wget -qi - --show-progress

sudo unzip -q -d /opt/azure-functions-cli Azure.Functions.Cli.*.zip
sudo chmod +x /opt/azure-functions-cli/func
sudo chmod +x /opt/azure-functions-cli/gozip

rm -f Azure.Functions.Cli*.zip

