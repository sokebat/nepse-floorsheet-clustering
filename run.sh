#!/usr/bin/env bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

if [ ! -d .venv ]; then
    echo "Virtual environment not found. Running setup first..."
    ./setup.sh
fi

echo
echo "starting......"
source .venv/bin/activate
