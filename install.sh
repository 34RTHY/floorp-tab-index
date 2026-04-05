#!/bin/bash
# Install or sync Floorp userChrome.css
# Usage:
#   ./install.sh          Install dotfiles → Floorp profile
#   ./install.sh pull     Pull from Floorp profile → dotfiles
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Find Floorp profile directory
if [[ "$OSTYPE" == "darwin"* ]]; then
  PROFILES_DIR="$HOME/Library/Application Support/Floorp/Profiles"
elif [[ -d "$HOME/.floorp" ]]; then
  PROFILES_DIR="$HOME/.floorp"
else
  PROFILES_DIR="$HOME/.var/app/one.ablaze.floorp/.floorp"
fi

if [[ ! -d "$PROFILES_DIR" ]]; then
  echo "Error: Floorp profiles directory not found at $PROFILES_DIR"
  echo "Make sure Floorp has been launched at least once."
  exit 1
fi

# Find the default-release profile (or first profile)
PROFILE=$(find "$PROFILES_DIR" -maxdepth 1 -name "*.default-release" -type d | head -1)
if [[ -z "$PROFILE" ]]; then
  PROFILE=$(find "$PROFILES_DIR" -maxdepth 1 -mindepth 1 -type d | head -1)
fi

if [[ -z "$PROFILE" ]]; then
  echo "Error: No Floorp profile found"
  exit 1
fi

CHROME_DIR="$PROFILE/chrome"
mkdir -p "$CHROME_DIR"

if [[ "$1" == "pull" ]]; then
  # Pull from Floorp profile → dotfiles
  if [[ -f "$CHROME_DIR/userChrome.css" ]]; then
    cp "$CHROME_DIR/userChrome.css" "$SCRIPT_DIR/userChrome.css"
    echo "Pulled userChrome.css from: $CHROME_DIR"
  else
    echo "No userChrome.css found in Floorp profile"
    exit 1
  fi
else
  # Install dotfiles → Floorp profile
  if [[ -f "$CHROME_DIR/userChrome.css" ]]; then
    cp "$CHROME_DIR/userChrome.css" "$CHROME_DIR/userChrome.css.bak"
    echo "Backed up existing userChrome.css"
  fi
  cp "$SCRIPT_DIR/userChrome.css" "$CHROME_DIR/userChrome.css"
  echo "Installed userChrome.css to: $CHROME_DIR"
  echo "Restart Floorp to see changes."
fi
