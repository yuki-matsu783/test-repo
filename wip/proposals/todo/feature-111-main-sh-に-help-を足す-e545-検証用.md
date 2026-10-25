---
version: 1
ticket: feature-111-main-sh-に-help-を足す-e545-検証用
issue: 111
mr: 112
title: "main.sh に --help を足す（E545 検証用）"
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
  main.sh は使い方を引数の並びでしか示せず、--help を打つと引数不足として終了コード 1 で終わる。
  --help で使い方を標準出力に出し、終了コード 0 で終わるようにして、確かめやすくする。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh に `--help`（と `-h`）を足す。打たれたら使い方を標準出力に出し、終了コード 0 で終わる。
引数が足りないときの振る舞い（標準エラーへの使い方と終了コード 1）は変えない。

## 範囲

- `main.sh` の `main()` の先頭に、第 1 引数が `-h` または `--help` のときの分岐を足す
- 出す内容は、既存の使い方の 1 行（`使い方: sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>`）と、
  既存のヘッダコメントの引数の説明に揃える。出力の接頭辞には `.txt` を付けない
- 分岐は入力・出力ファイルに触れる処理より前に置く（`--help` のとき出力ファイルを作らない）

## 対象外

- `main.sh` 以外のファイル（README.md・index.html など）は変えない
- 第 2 引数以降に `--help` があるときの扱いは変えない（第 1 引数だけを見る）
- ヘッダコメントの書式や、既存の終了コードの決まりは変えない

## 完了の確かめ方

- `sh main.sh --help` と `sh main.sh -h` が、使い方を標準出力に 1 行出し、終了コード 0 で終わる
- 上の 2 つを打ったあと、カレントディレクトリに `.txt` の出力ファイルができていない
- `sh main.sh`（引数なし）と `sh main.sh a b`（引数 2 つ）は、従来どおり標準エラーへ使い方を出して終了コード 1 で終わる
- `sh main.sh access.log ERROR errors` の従来の動作（`errors.txt` を書く）が変わらない

## 計画の理由

変更は `main.sh` 1 ファイルの小さな分岐に限られ、設計判断も並行作業も要らない。
そのため計画は `quick-work` の 1 ステップ（子 1 つ）にする。範囲は `main.sh` だけに絞る。
