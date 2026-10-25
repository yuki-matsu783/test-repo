---
version: 1
ticket: feature-187-version-option-01-01
parent: feature-187-version-option
phase: 1
title: main.sh に --version を足す（小さい作業）
human_review:
  required: true
  reason: 入口の分岐を足すため、既存の引数の振る舞いに触れる
allow:
  - match: Write|Edit
    glob: "main.sh"
  - match: Write|Edit
    glob: "tests/*"
  - match: Write|Edit
    glob: "docs/wiki/*"
started_at: "2026-10-25T21:58:47+0000"
base_sha: "75d83d986b2272417f90fbf98fb0dc171461bfcd"
---
親の範囲の中で次をする。

1. `main.sh` の先頭に版の定数（例: `VERSION="0.1.0"`）を置く。版の値はユーザが後で直せるよう定数に 1 か所だけ書く
2. `main` の先頭で、第 1 引数が `--version` のときは `main.sh <版>` を標準出力へ出して終了コード 0 で終わる。引数の数の検査より前に置く
3. `tests/` にテストを置く（`--version` の表示と終了コード、引数不足で終了コード 1 と使い方が出ること、入力ファイル無しでエラーになること）
4. `docs/wiki/` の使い方の記述に `--version` を 1 行足す

絞り込み・出力の処理は変えない。`.claude/skills/*` には触れない。
