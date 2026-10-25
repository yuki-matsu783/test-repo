---
version: 1
ticket: feature-57-usage-exit-code
issue: 57
mr: 58
title: "main.sh の使い方の表示に終了コードを書く（H1 検証用）"
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
  issue #57 は、引数が足りないときの使い方の表示に終了コード 1 を書くことを求めている。main.sh は既に exit 1 で終了しているので、表示の文だけを変える小さな作業。ccnavi 検証 H1 用。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

引数が足りないときに表示する使い方の文に、終了コード 1 で終わることを書く。

## 範囲

- `main.sh` の `main` 関数の、引数の数を調べる箇所の `echo`（使い方の表示）の文だけ。
- 提案の案: `使い方: sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>（終了コード 1）` のように、同じ行の末尾に足す。終了の仕方（`exit 1`）は変えない。

## 対象外

- 終了コードの値そのもの、他のエラー表示、README の変更。
- MR !58 に既にある README.md の下書き（「H1 検証用の下書き」の印と「テスト」の重複行）。この MR の差分に残るので、消すかどうかはユーザに確かめる。

## 完了の確かめ方

- 引数を 2 つ以下にして `sh main.sh` を実行し、表示に「終了コード 1」が含まれ、終了コードが 1 であること。
- 引数を 3 つ揃えて実行したとき、表示が出ず従来どおり動くこと。

## 計画の理由

変える箇所が 1 行の表示だけで、設計判断や並行作業が要らないため quick-work にする。
