#!/bin/bash
set -euo errtrace

# Handle errors.
error_handle() {
    echo "error: ${BASH_SOURCE[1]} at line ${BASH_LINENO[0]}"
    echo "Are you sure you ran the install.sh script?"
}
trap error_handle ERR

# Ensure we are in the correct directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$SCRIPT_DIR"

# Build the project, open studio & serve it.
rojo build default.project.json -o Place.rbxl
start Place.rbxl
rojo serve default.project.json
