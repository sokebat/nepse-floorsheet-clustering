#!/usr/bin/env bash
set -e

# Always target the directory where setup.sh actually lives
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo "=== Setting up Python Environment ==="

# Check if python3-venv is available on system
if ! python3 -m venv --help > /dev/null 2>&1; then
    echo "Installing python3-venv..."
    sudo apt update && sudo apt install -y python3-venv python3-pip
fi

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment in .venv..."
    python3 -m venv .venv
fi

# Activate and upgrade pip
echo "Activating virtual environment..."
source .venv/bin/activate

echo "Upgrading pip and installing requirements..."
pip install --upgrade pip
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "Warning: requirements.txt not found!"
fi

echo "=== Setup Completed Successfully! ==="