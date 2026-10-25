---
version: 1
ticket: feature-187-version-option
issue: 187
mr: 188
title: "main.sh に --version オプションを足す (G1)"
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
  main.sh に --version を足して、バージョンを引数だけで確かめられるようにする。
  変更は main.sh の入口の分岐と、その振る舞いを確かめるテストと、使い方の wiki の 1 行に限る。
  処理の本体（絞り込みと出力）は変えない。
allow:
  - match: Write|Edit
    glob: "main.sh"
  - match: Write|Edit
    glob: "tests/*"
  - match: Write|Edit
    glob: "docs/wiki/*"
  - match: Write|Edit
    glob: ".claude/skills/*"
---
## 目的

`sh main.sh --version` でバージョンを表示し、終了コード 0 で終わるようにする。
今は引数が足りないとして使い方を出すので、バージョンを知る手段が無い。

## 範囲

- `main.sh`: バージョンの定数を 1 つ置き、`main` の先頭で `--version`（第 1 引数のとき）を扱う。表示は `main.sh <版>` の 1 行を標準出力へ。終了コードは 0
- `tests/*`: `--version` の表示と終了コード、引数が足りないときの既存の振る舞いが変わらないことを確かめるテストを置く
- `docs/wiki/*`: 使い方の wiki に `--version` の 1 行を足す
- `.claude/skills/*`: 今回の作業の振り返りで、スキルに直すべき点が出た場合だけ触る（既定では触らない）

## 対象外

- 入力ファイル・絞り込み・出力の処理そのもの
- `README.md` の仕様（演習の課題文）
- 版の番号付けの運用（タグ作成・リリース）。版の値は `main.sh` の定数に置くだけ

## 完了の確かめ方

- `sh main.sh --version` が `main.sh <版>` を 1 行出し、終了コード 0 で終わる
- `sh main.sh` の引数不足は、これまでどおり使い方を出して終了コード 1
- `tests/*` のテストが通る
- `docs/wiki/*` に `--version` の記述が入っている

## 計画の理由

設計判断は要らず、触る箇所は限られるので、1 ステップの quick-work で親 1 子 1 として回す。
範囲は親の範囲そのままで、子もこの範囲の中に収まる。
