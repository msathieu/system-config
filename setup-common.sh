#!/bin/bash
set -euo pipefail
cp -R common/* /
sed -E "s/#(auth.+required)/\1/" -i /etc/pam.d/su
