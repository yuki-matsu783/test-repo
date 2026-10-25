---
version: 1
ticket: feature-63-main-sh-の使い方に例を足す-h13-検証用
issue: 63
mr: 64
title: "main.sh の使い方に例を足す（H13 検証用）"
phases:
  quick-work:
    kind: work
    title: 小さい作業
    review: mr
    scope: inherit
    when: 設計判断や並行作業が要らないとき
plan:
  - quick-work
rationale: |
  issue #63 の依頼で、使い方の表示に実行例を 1 行足す。変更は main.sh の 1 箇所だけで、設計判断も並行作業も要らないため quick-work にする。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

`main.sh` の引数が足りないときに出る使い方の表示へ、実行例を 1 行足す。利用者が書式を見て、そのまま打てる例を見られるようにする。

## 範囲

- `main.sh` の `main` 関数内、使い方を表示する `echo` の直後に、例を表示する `echo` を 1 行足す。
  - 追加する行: `echo "例: sh main.sh input.txt ERROR error-log" >&2`
  - 出力の表示は既存の使い方の行と同じく標準エラー（`>&2`）に出す。

## 対象外

- 処理の中身（絞り込み・整形・出力）は変えない。
- 使い方の文言（既存の行）は変えない。
- `README.md` は変えない。
- エラーメッセージの文言や終了コードは変えない。

## 完了の確かめ方

- `sh main.sh` を引数無しで実行し、使い方の行に続けて例の行が標準エラーに出て、終了コードが 1 であること。
- `sh main.sh input.txt ERROR error-log` を、`input.txt` を用意して実行し、`error-log.txt` が従来どおり作られること。
- `sh -n main.sh` が通ること。

## 計画の理由

変更は 1 ファイルの数行に限られ、フェーズを分ける必要がない。範囲は `main.sh` だけなので、allow もその 1 つに絞る。
