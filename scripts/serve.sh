#!/bin/bash
set -euo errtrace

# Handle errors.
error_handle() {
    echo "error: ${BASH_SOURCE[1]} at line ${BASH_LINENO[0]}"
    echo "Are you sure you ran the install.sh script?"
}
trap error_handle ERR

# Build the project & serve it.
rojo build default.project.json -o Place.rbxl
rojo serve default.project.json
