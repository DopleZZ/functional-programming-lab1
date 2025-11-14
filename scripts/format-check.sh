#!/usr/bin/env bash
set -euo pipefail

FILES=$(git ls-files '*.hs')
if [[ -z "$FILES" ]]; then
  echo "No Haskell files found"
  exit 0
fi

echo "Checking formatting with ormolu..."
ormolu --mode check $FILES
