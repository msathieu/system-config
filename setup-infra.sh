#!/bin/bash
set -euo pipefail
cp -R infra/* /
sh setup-server.sh
