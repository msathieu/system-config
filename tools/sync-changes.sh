#!/bin/bash
set -euo pipefail

ssh infra "cd /var/lib/system-config; git pull; ./setup.sh infra"
ssh vps "cd /var/lib/system-config; git pull; ./setup.sh vps"
ssh gpu "cd /var/lib/system-config; git pull; ./setup.sh gpu"
