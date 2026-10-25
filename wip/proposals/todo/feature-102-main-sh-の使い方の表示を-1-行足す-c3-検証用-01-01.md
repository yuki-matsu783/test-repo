---
version: 1
ticket: feature-102-main-sh-の使い方の表示を-1-行足す-c3-検証用-01-01
parent: feature-102-main-sh-の使い方の表示を-1-行足す-c3-検証用
phase: 1
title: "main.sh の使い方の表示に出力先を 1 行足す（フェーズ 1 の 1 本目）"
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

親の目的のとおり、`main.sh` の引数不足の使い方に、出力先（`<出力の接頭辞>.txt`）を示す 1 行を足す。

## 範囲

- `main.sh` の `main` 関数の、引数不足を見る `if` の中に、`echo "出力は <出力の接頭辞>.txt に書かれる" >&2` を 1 行足す（既存の `echo` の行の後）。
- 他の行・処理は触らない。

## 対象外

- `main.sh` 以外のファイル。
- 絞り込み・出力・終了コード・入力検査の変更。

## 完了の確かめ方

- `sh main.sh` を引数なしで打つと、使い方の行が 3 行出て終了コード 1 になる。
- `sh main.sh access.log ERROR errors` の `errors.txt` の中身が変更前と同じ。
