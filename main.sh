#!/bin/sh
set -eu

VERSION="0.1.0"

# 入力を読み、条件で絞り、整形して出力する
main() {
  if [ "${1:-}" = "--version" ]; then
    echo "$VERSION"
    exit 0
  fi

  if [ "$#" -lt 3 ]; then
    echo "使い方: sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>" >&2
    exit 1
  fi

  input="$1"
  pattern="$2"
  output="$3.txt"

  if [ ! -f "$input" ]; then
    echo "エラー: 入力ファイルが見つかりません: $input" >&2
    exit 1
  fi

  # 絞り込みパターンを含む行だけ残し、行頭の空白を除いて番号を振る
  # パターンは ENVIRON で渡す（-v だと \ が解釈されるため）
  PAT="$pattern" awk '
    BEGIN { p = ENVIRON["PAT"]; n = 0 }
    p == "" || index($0, p) > 0 {
      sub(/^[ \t]+/, "")
      n++
      print n ". " $0
    }
  ' "$input" > "$output"
}

main "$@"
