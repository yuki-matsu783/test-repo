---
version: 1
ticket: feature-143-main-sh-の挙動を調べる-rb-検証用
issue: 143
mr: 144
human_review:
  required: false
  reason: 調査の結果は MR のレビューで足りる
title: "main.sh の挙動を調べる（RB 検証用）"
phases:
  research:
    kind: work
    title: 調査
    review: none
    scope:
    - wip/research/*
    deliverables:
    - wip/research/summary.md
    when: 既存の振る舞いや依存が分からないとき。分かっているなら省略する
plan:
  - research
rationale: |
  main.sh の引数・絞り込み・出力・終了コードの振る舞いを、コードを変えずに読んで確かめて整理する。調べた結果を次の判断の材料にする。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
## 目的

main.sh の挙動（引数の扱い、絞り込みの条件、出力ファイル、終了コード）を、main.sh を変えずに確かめ、結果を 1 つの要約にまとめる。

## 範囲

- main.sh を読み、引数・絞り込み・出力・終了コードの振る舞いを整理する
- 振る舞いを確かめるための入力例と実行結果を、`wip/research/` の中に残す
- 結果を `wip/research/summary.md` にまとめる

## 対象外

- main.sh を含め、`wip/research/*` の外のファイルへの変更（読むことは含む）
- main.sh の修正・機能の追加
- 検証のために作るファイルを `wip/research/*` の外に置くこと

## 完了の確かめ方

- `wip/research/summary.md` があり、引数の扱い・絞り込み・出力ファイル・終了コード（0 と 1）の 4 点を、確かめた結果とともに書いてある
- 要約に書いた振る舞いを、`sh main.sh` を実際に打った結果（終了コードと出力）で裏付けてある
- 変更されたファイルが `wip/research/*` の中だけである（`git status` で確かめる）

## 計画の理由

調査のフェーズ 1 つだけで足りる。調べた結果は要約にまとめ、その後の判断は MR のレビューで受ける。設計や実装の変更は、この調査の結果を見てから決める。
