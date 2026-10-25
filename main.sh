#!/bin/sh
set -eu

# 入力を読み、条件で絞り、整形して出力する
#
# 使い方（検証）: sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>
#
# 引数:
#   入力ファイル      読む元のファイル。存在しないとエラーになる
#                     （終了コード 1 で終わり、「エラー: 入力ファイルが見つかりません: <パス>」と出る）
#   絞り込みパターン  この文字列を含む行だけを残す（空文字なら全行を残す）
#   出力の接頭辞      <出力の接頭辞>.txt に書く
#
# 終了コード:
#   0  正常に終わった
#   1  引数が足りない、または入力ファイルが無い
#
# 例:
#   sh main.sh access.log ERROR errors
#   → access.log から ERROR を含む行を取り、番号を振って errors.txt に書く
main() {
  if [ "$#" -lt 3 ]; then
    echo "使い方（検証）: sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>" >&2
    echo "  入力ファイル:     読む元のファイル。無いとエラーで終わる" >&2
    echo "  絞り込みパターン: この文字列を含む行だけ残す。空文字なら全行を残す" >&2
    echo "  出力の接頭辞:     <出力の接頭辞>.txt に書く" >&2
    echo "引数が足りないと終了コード 1 で終わる。例: sh main.sh access.log ERROR errors" >&2
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
