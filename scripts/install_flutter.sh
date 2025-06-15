#!/usr/bin/env bash
set -euo pipefail

FLUTTER_DIR="$HOME/flutter"
BRANCH="${FLUTTER_VERSION:-stable}"

if [ ! -d "$FLUTTER_DIR" ]; then
  echo "Cloning Flutter SDK to $FLUTTER_DIR" >&2
  git clone --depth 1 -b "$BRANCH" https://github.com/flutter/flutter.git "$FLUTTER_DIR"
else
  echo "Flutter SDK already present at $FLUTTER_DIR" >&2
fi

if [[ ":$PATH:" != *":$FLUTTER_DIR/bin:"* ]]; then
  export PATH="$FLUTTER_DIR/bin:$PATH"
fi

"$FLUTTER_DIR/bin/flutter" --version