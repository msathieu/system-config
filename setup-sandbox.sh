#!/bin/bash
set -euo pipefail
cp -R sandbox/* /
sh setup-server.sh
