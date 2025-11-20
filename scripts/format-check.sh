#!/usr/bin/env bash
set -euo pipefail

FILES=$(git ls-files '*.hs')
if [[ -z "$FILES" ]]; then
  echo "No Haskell files found"
  exit 0
fi


resolve_ormolu() {
  if command -v ormolu >/dev/null 2>&1; then echo "$(command -v ormolu)"; return; fi
  for p in "$HOME/.cabal/bin/ormolu" "$HOME/.ghcup/bin/ormolu" "$HOME/.local/bin/ormolu"; do
    if [[ -x "$p" ]]; then echo "$p"; return; fi
  done
  echo ""; return
}

ORMOLU_BIN=${ORMOLU:-"$(resolve_ormolu)"}
if [[ -z "$ORMOLU_BIN" ]]; then
  echo "ormolu not found. Set $ORMOLU to its path or add to PATH." >&2
  exit 127
fi

echo "Checking formatting with: $ORMOLU_BIN"
"$ORMOLU_BIN" --mode check $FILES
