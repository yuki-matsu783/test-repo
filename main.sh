#!/usr/bin/env bash
set -euo pipefail

# TODO: 入力を読み、条件で絞り、整形して出力する
main() {
  local input="$1"
  cat -- "$input"
}

main "$@"
