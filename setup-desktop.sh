#!/bin/bash
set -euo pipefail
flatpak remote-delete fedora || true
dconf update
