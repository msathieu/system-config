#!/bin/bash
set -euo pipefail
cp -R sandbox/* /
bash setup-server.sh
