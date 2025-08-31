#!/usr/bin/env bash
set -euo pipefail
rpm-ostree kargs --append-if-missing=lockdown=confidentiality
systemctl disable auditd
