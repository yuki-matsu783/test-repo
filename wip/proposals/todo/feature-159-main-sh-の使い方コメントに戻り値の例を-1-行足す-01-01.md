---
version: 1
ticket: feature-159-main-sh-の使い方コメントに戻り値の例を-1-行足す-01-01
parent: feature-159-main-sh-の使い方コメントに戻り値の例を-1-行足す
phase: 1
title: "main.sh の先頭コメントの例に、戻り値の例を 1 行足す"
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

親の目的（main.sh を読むだけで、戻り値の具体例が分かるようにする）を、フェーズ 1 の 1 作業で満たす。

## 範囲

- main.sh の先頭コメントの「例」の節に、入力ファイルが無いときの戻り値の例を 1 行足す（例: `sh main.sh missing.log ERROR errors` → 「エラー: 入力ファイルが見つかりません: missing.log」を標準エラーに出し、終了コード 1 で終わる）

## 対象外

- main.sh の処理内容・絞り込みの動作・出力ファイル名・終了コードの値（コードは変えない）
- main.sh 以外のファイル

## 完了の確かめ方

- `sh -n main.sh` が構文エラーなしで終わる
- 追加した例の入力ファイルを存在しない名前にして `sh main.sh <存在しない名前> ERROR errors` を打ち、コメントに書いた文言と終了コード 1 が実際に一致する
- `git diff` で変わるのは main.sh のコメント行だけ
