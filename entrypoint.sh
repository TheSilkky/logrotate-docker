#!/bin/sh
set -e

echo "Running logrotate: $(date)"

exec "$@"