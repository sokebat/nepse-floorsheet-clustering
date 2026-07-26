#!/usr/bin/env bash
set -e

# Always target the directory where run.sh lives
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Check if the virtual environment exists, run setup if missing
if [ ! -d ".venv" ]; then
    echo "Virtual environment not found. Running setup.sh first..."
    if [ -f "./setup.sh" ]; then
        chmod +x ./setup.sh
        ./setup.sh
    else
        echo "Error: setup.sh not found!"
        exit 1
    fi
fi

echo
echo "Starting application..."

# Activate the virtual environment
source .venv/bin/activate