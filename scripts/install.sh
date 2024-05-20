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
    # Ask the user if they want to install aftman
    read -p "Aftman is not installed. Do you want to install it automatically? (Y/N) " answer
    case $answer in
        y|Y )
            # Check the user's operating system
            OS=$(uname | tr '[:upper:]' '[:lower:]')
            case $OS in
                msys* | mingw* | cygwin* ) # Windows (Cygwin/MSYS)
                    # Download the executable
                    curl -L -o aftman.zip "https://github.com/LPGhatguy/aftman/releases/download/v0.2.8/aftman-0.2.8-windows-x86_64.zip"
                    # Extract the file.
                    unzip aftman.zip
                    # Run the installation command
                    ./aftman self-install
                    # Remove the downloaded files
                    rm aftman.exe
                    rm aftman.zip
                    ;;
                * )
                    echo "Unsupported operating system. Please install it manually from https://github.com/LPGhatguy/aftman/releases"
                    exit 1
                    ;;
            esac
            ;;
        n|N )
            echo "Aborting installation."
            exit 1
            ;;
        * )
            echo "Invalid input! Please pick between Y (Yes) and N (No)."
            exit 1
            ;;
    esac
fi

# Install dependencies
aftman install --no-trust-check
wally install
git submodule update --init

# Build the project
rojo sourcemap default.project.json -o sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages
rojo build default.project.json -o Place.rbxl

# Readd .gitkeep to packages folder
touch Packages/.gitkeep

# Remove .git tracking
if ! $GITKEEP; then
  git remote remove origin
fi

# Success
echo "Successfully installed project dependencies."
