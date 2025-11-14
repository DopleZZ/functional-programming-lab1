#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
cd "$ROOT_DIR"

EXPECTED_3=6857
EXPECTED_28=669171001

fail=0

run_and_check() {
  local file="$1"; local expected="$2"
  echo "Running: $file" >&2
  out=$(runghc "$file") || { echo "FAILED: $file (runtime error)"; return 1; }
  if [[ "$out" != "$expected" ]]; then
    echo "FAILED: $file -> got '$out', expected '$expected'" >&2
    return 1
  fi
  echo "OK: $file => $out" >&2
}

for f in 3/*.hs; do
  run_and_check "$f" "$EXPECTED_3" || fail=1
done

for f in 28/*.hs; do
  run_and_check "$f" "$EXPECTED_28" || fail=1
done

exit "$fail"
