#!/bin/bash
set -euo errtrace

# Handle errors.
error_handle() {
    echo "error: ${BASH_SOURCE[1]} at line ${BASH_LINENO[0]}"
    echo "Are you sure you ran the install.sh script?"
}
trap error_handle ERR

# Build the project.
wally install
rojo sourcemap default.project.json -o sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages
rojo build default.project.json -o Place.rbxl

echo "Successfully built the project."
