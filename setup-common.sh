#!/bin/sh
set -e
cp -R common/* /
sed -E "s/#(auth.+required)/\1/" -i /etc/pam.d/su
