---
version: 1
ticket: feature-68-main-sh-の使い方に終了コードを書く-h3-検証用
issue: 68
mr: 69
title: "main.sh の使い方に終了コードを書く（H3 検証用）"
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
  issue #68 は「使い方の表示に終了コードを書く」。範囲は main.sh のみで、設計判断も並行作業も要らないため quick-work。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

issue #68「使い方の表示に終了コードを書く」。引数不足で使い方を出して終了するときの終了コードを、実行する側が判別できる形で明示する。

現状の main.sh は、引数不足のときに使い方を stderr へ出して `exit 1` する。入力ファイル無しのエラーも `exit 1` で、使い方の誤りと実行時のエラーが同じ値になっている。

## 範囲

- main.sh の引数不足の分岐（使い方の表示）を `exit 2` にする（使い方の誤りは 2、入力ファイル無しなど実行時のエラーは従来どおり 1）
- main.sh の先頭コメントに終了コードの対応（0 / 1 / 2）を一行ずつ書く
- 使い方の文言（stderr の 1 行目）は変えない

## 対象外

- 入力ファイル無しの `exit 1` の変更
- README.md の更新（README は「main 関数の中身（TODO の箇所）」と書いているが、現在の main.sh は実装済み。この食い違いは別件として扱う）
- 絞り込み・整形の動作の変更

## 完了の確かめ方

- `sh main.sh; echo $?` が 2 を返し、stderr に使い方が出る
- `sh main.sh a b c` で入力ファイルが無いとき `echo $?` が 1 を返す
- `sh main.sh 入力.txt パターン 出力` が従来どおり 0 で終わり、出力ファイルができる
- 変更は main.sh のみ（`git diff --stat` で確かめる）

## 計画の理由

範囲が main.sh の一箇所に収まり、設計の選択も小さい。大きい作業にする理由がない。
