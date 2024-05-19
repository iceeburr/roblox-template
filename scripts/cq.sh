#!/bin/bash
set -euo errtrace

# Handle errors.
error_handle() {
    if [[ ${BASH_COMMAND} == *"luau-lsp analyze"* ]]; then
        echo $1
        echo "Failed code quality checks!"
    else
        echo "error: $1 at line ${BASH_LINENO[0]}"
        echo "Are you sure you ran the install.sh script?"
    fi
}
trap 'error_handle "$BASH_COMMAND"' ERR

# Build the project.
wally install
rojo sourcemap default.project.json -o sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages
curl -L "https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua" > "globalTypes.d.lua"
rojo sourcemap default.project.json -o sourcemap.json
luau-lsp analyze --sourcemap sourcemap.json --definitions globalTypes.d.lua src tests

echo "Successfully ran code quality checks."
