---
version: 1
ticket: feature-161-main-sh-の使い方コメントに戻り値の例を-1-行足す-01-01
parent: feature-161-main-sh-の使い方コメントに戻り値の例を-1-行足す
phase: 1
title: "main.sh の「例:」の節に戻り値の例を 1 行足す"
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh の使い方コメントの「例:」の節に、入力ファイルが無いときの戻り値（終了コード 1）の例を 1 行足す。

## 変更

main.sh の先頭コメントの「例:」の節の末尾（`#   → access.log から ERROR を含む行を取り…` の行の後ろ）に、次の 1 行を足す。

```
#   sh main.sh missing.log ERROR errors  → 終了コード 1（「エラー: 入力ファイルが見つかりません: missing.log」と出る）
```

- 足すのはコメント行 1 行だけ。コードの行、ほかのコメント行は触らない
- 「1 行足す」の issue の文言に合わせ、1 行にまとめる

## 完了の確かめ方

- `sh -n main.sh` が終了コード 0
- `sh main.sh missing.log ERROR errors; echo $?` が 1 を出し、足した例の内容と一致する
- `git diff` の差分が、main.sh の 1 行の追加だけである

## 対象外

- 使い方コメントの他の節、引数の説明、終了コードの説明の書き換え
- main.sh の処理・エラー文言の変更
