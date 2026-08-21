#!/usr/bin/env bash
set -euo pipefail

# 入力を1行ずつ読む関心だけを持つ
take_lines() {
  local input="$1"
  cat -- "$input"
}

# どの行を残すかの関心だけを持つ
keep_lines() {
  local pattern="$1"
  grep -E -- "$pattern" || true
}

# 出力の見た目の関心だけを持つ
label_lines() {
  local prefix="$1"
  local line
  while IFS= read -r line; do
    printf '%s%s\n' "$prefix" "$line"
  done
}

main() {
  take_lines "$1" | keep_lines "$2" | label_lines "$3"
}

main "$@"
