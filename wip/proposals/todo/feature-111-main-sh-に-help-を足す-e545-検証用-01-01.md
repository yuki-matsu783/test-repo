---
version: 1
ticket: feature-111-main-sh-に-help-を足す-e545-検証用-01-01
parent: feature-111-main-sh-に-help-を足す-e545-検証用
phase: 1
predecessors: []
title: "main.sh に --help（-h）を足す"
rationale: |
  main.sh の第 1 引数に -h または --help が来たら、使い方を標準出力に出して終了コード 0 で終わる。
  出力ファイルには触れない。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

`sh main.sh --help` と `sh main.sh -h` で使い方を標準出力に出し、終了コード 0 で終わるようにする。
それ以外（引数不足・入力ファイル無しの終了コード 1 など）の振る舞いは変えない。

## 範囲

- `main.sh` の `main()` の先頭（引数の個数を見る前）に、第 1 引数が `-h` か `--help` のときの分岐を足す
- 分岐は使い方の 1 行（`使い方: sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>`）を標準出力に出して `exit 0`
- ヘッダコメントの「使い方」の行の下に、`--help` を打てば使い方が出る旨を 1 行足してもよい（任意。足すなら範囲内）

## 対象外

- `main.sh` 以外のファイル
- 第 2 引数以降の `--help` の扱い
- 既存の終了コードの決まり、ヘッダコメントの他の部分

## 完了の確かめ方

- `sh main.sh --help` と `sh main.sh -h`: 標準出力に使い方の 1 行、終了コード 0。カレントディレクトリに `.txt` が増えていない
- `sh main.sh`（引数なし）: 従来どおり標準エラーに使い方、終了コード 1
- `sh main.sh no-such.log X out`: 従来どおり「エラー: 入力ファイルが見つかりません」、終了コード 1
- `sh main.sh access.log ERROR errors`: 従来どおり `errors.txt` を書く

## 計画の理由

親（quick-work 1 ステップ）の唯一の子。作業は `main.sh` の分岐 1 か所で、設計の判断は要らない。
