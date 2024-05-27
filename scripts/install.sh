#!/bin/bash
set -euo errtrace

# Handle errors
error_handle() {
    echo "error: ${BASH_SOURCE[1]} at line ${BASH_LINENO[0]}"
    echo "An unexpected error has occured."
}
trap error_handle ERR

# Ensure we are in the correct directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$SCRIPT_DIR"

# Options
GITKEEP=false

for i in "$@"; do
  case $i in
    -gk|--gitkeep|--git-keep)
      GITKEEP=true
      shift
      ;;
    -*|--*)
      echo "Unknown Option $i"
      exit 1
      ;;
    *)
      ;;
  esac
done

# Check if aftman is installed
if ! command -v aftman >/dev/null 2>&1; then
    echo "Aftman not installed! Please install it manually from https://github.com/LPGhatguy/aftman/releases"
    exit 1
fi

# Install dependencies
aftman add --global rojo-rbx/rojo
aftman add --global UpliftGames/wally
aftman install --no-trust-check
wally install
git submodule update --init

# Build the project
rojo sourcemap default.project.json -o sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages
rojo build default.project.json -o Place.rbxl

# Remove .git tracking
if ! $GITKEEP; then
  git remote remove origin
fi

# Success
echo "Successfully installed project dependencies."
