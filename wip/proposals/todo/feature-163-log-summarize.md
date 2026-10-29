---
version: 1
ticket: feature-163-log-summarize
issue: 163
mr: 164
title: "ログ集計の補助スクリプト src/summarize.sh と tests/summarize_test.sh を新設する"
phases:
  design:
    kind: work
    title: 設計
    review: mr
    scope:
    - wip/design/*
    - docs/*
    deliverables:
    - wip/design/*.md
    when: 変更箇所が 3 か所を超えるか、外から見える振る舞いが変わるとき
  acceptance:
    kind: work
    title: 受入テスト作成
    review: mr
    scope:
    - tests/*
    when: 振る舞いが変わるとき。実装と並行してよい（実装のステップの `after` にこのステップを書かなければ並行する）
  implement:
    kind: work
    title: 実装とテスト
    review: mr
    scope:
    - src/*
    - tests/*
    when: 振る舞いを変えるとき。受入テスト作成を先に置く（計画に受入テスト作成の項も置く）
plan:
  - design
  - {type: acceptance, after: [1]}
  - {type: implement, after: [1, 2]}
rationale: |
  issue #163 は、ログ集計の補助スクリプト src/summarize.sh と、その受入テスト tests/summarize_test.sh の新設を求めている。
  新しい振る舞いを足すので、設計（入力のログ形式・集計の項目・出力の形・終了コード）を先に決め、
  受入テストで仕様を固定してから実装する。issue には入力形式が書かれていないため、設計で決める。
allow:
  - match: Write|Edit
    glob: "wip/design/*"
  - match: Write|Edit
    glob: "docs/*"
  - match: Write|Edit
    glob: "tests/*"
  - match: Write|Edit
    glob: "src/*"
---
## 目的

ログファイルを読み、レベル（INFO・WARN・ERROR など）ごとの件数を集計して標準出力に出す補助スクリプト `src/summarize.sh` を新設する（issue #163）。

## 範囲

- `src/summarize.sh`（新規）: 入力のログを読み、集計結果を出す。引数・終了コードの扱いは設計メモ（フェーズ 1）に従う
- `tests/summarize_test.sh`（新規）: 受入テスト。正常系（件数の集計）と、引数・入力の誤りの系を確かめる
- 入力のログ形式・集計の項目・出力の形は、`wip/design/summarize.md` に書いて決める（フェーズ 1）

## 対象外

- 既存のスクリプト・設定・ドキュメントの変更
- ログを書き出す側の変更
- 集計結果の保存・通知・外部への送信

## 完了の確かめ方

- `sh tests/summarize_test.sh` が全件通って終了コード 0 で終わる
- `sh -n src/summarize.sh` が構文エラーなしで終わる
- 引数なしで打つと使い方を標準エラーに出し、終了コード 1 で終わる
- 存在しないファイルを渡すと、その旨を標準エラーに出し、終了コード 1 で終わる

## 計画の理由

設計（1）で入出力と終了コードを決め、受入テスト（2）が設計どおりの振る舞いを固定し、実装（3）は両方の後に行う。受入テストは実装と並行しても書けるが、仕様が決まる前には書けないので、設計の後に置いた。
