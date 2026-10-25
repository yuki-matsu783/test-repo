---
version: 1
ticket: feature-169-main-sh-の使い方コメントに戻り値の例を-1-行足す-01-01
parent: feature-169-main-sh-の使い方コメントに戻り値の例を-1-行足す
phase: 1
title: "main.sh の使い方コメントに戻り値の例を 1 行足す（小さい作業）"
human_review:
  required: true
  reason: 親の承認と同じく、コメントの 1 行の追加を人が確かめるため
allow:
  - match: Write|Edit
    glob: "main.sh"
---
main.sh の先頭の使い方コメント（`# 例:` の節）に、入力ファイルが無いときの戻り値（終了コード 1）の例を 1 行足す。

- 既存の例の行（`#   sh main.sh access.log ERROR errors` と `#   → ...`）に書き方を揃える
- 例の内容: `sh main.sh missing.log ERROR errors` は終了コード 1 で終わる、という 1 行
- 変えるのはコメントの 1 行だけ。処理の本体には触れない

完了の確かめ方: `sh -n main.sh` が通り、`git diff` がコメント行の追加だけであること。
