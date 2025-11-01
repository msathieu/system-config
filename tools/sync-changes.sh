#!/bin/bash
set -euo pipefail

ssh infra "cd /var/lib/system-config; git pull; ./setup.sh infra"
ssh backups "cd /var/lib/system-config; git pull; ./setup.sh backups"
ssh vps "cd /var/lib/system-config; git pull; ./setup.sh vps"
ssh gpu "cd /var/lib/system-config; git pull; ./setup.sh gpu"
ssh home-gw "cd /var/lib/system-config; git pull; ./setup.sh home-gw"
