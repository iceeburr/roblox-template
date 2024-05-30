#!/bin/bash
set -euo errtrace

# Handle errors.
error_handle() {
    if [[ ${BASH_COMMAND} == *"luau-lsp analyze"* ]]; then
        echo $1
        stylua --check --verify src
        echo "Failed code quality checks!"
        exit 1
    elif [[ ${BASH_COMMAND} == *"stylua"* ]]; then
        echo $1
        echo "Stylua formatting failed!"
        exit 1
    else
        echo "error: $1 at line ${BASH_LINENO[0]}"
        echo "Are you sure you ran the install.sh script?"
        exit 1
    fi
}
trap 'error_handle "$BASH_COMMAND"' ERR

# Ensure we are in the correct directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$SCRIPT_DIR"

# Analyze the project.
curl -L "https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua" > "globalTypes.d.lua"
rojo sourcemap default.project.json -o sourcemap.json
luau-lsp analyze --sourcemap sourcemap.json --definitions globalTypes.d.lua \
--ignore Packages/**/*.lua --ignore Packages/**/*.lua \
--ignore CustomPackages/**/*.lua --ignore CustomPackages/**/*.luau \
src

stylua --check --verify src

echo "Successfully ran code quality checks."
