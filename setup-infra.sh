#!/bin/bash
set -euo pipefail
cp -R infra/* /
bash setup-server.sh
