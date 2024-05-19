#!/bin/bash
set -euo errtrace

# Handle errors.
error_handle() {
    echo "error: ${BASH_SOURCE[1]} at line ${BASH_LINENO[0]}"
    echo "Are you sure you ran the install.sh script?"
}
trap error_handle ERR

# Update wally types.
rojo sourcemap default.project.json -o sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages

echo "Successfully updated wally types."
