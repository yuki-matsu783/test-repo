---
version: 1
ticket: feature-165-summarize-script
issue: 165
mr: 166
title: "ログ集計の補助スクリプト src/summarize.sh と tests/summarize_test.sh を新設する"
phases:
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
  - acceptance
  - {type: implement, after: [1]}
rationale: |
  ccnavi の検証用に、ログを集計する小さなシェルスクリプトを新設する。
  振る舞いを新しく決めるので、先に受入テストで期待する出力を固めてから実装する。
allow:
  - match: Write|Edit
    glob: "tests/summarize_test.sh"
  - match: Write|Edit
    glob: "src/summarize.sh"
---
## 目的

ログファイルを 1 つ受け取り、レベルごとの行数を出す補助スクリプト `src/summarize.sh` を新設する。
あわせて、その振る舞いを確かめる `tests/summarize_test.sh` を置く。ccnavi の検証用。

## 範囲

- `tests/summarize_test.sh`（新規）: 受入テスト。フェーズ 1 で書く
- `src/summarize.sh`（新規）: 集計の実装。フェーズ 2 で書く
- 想定する振る舞い（案。承認の前にユーザが直す）:
  - 使い方は `sh src/summarize.sh <ログファイル>`
  - 行頭の `[INFO]`・`[WARN]`・`[ERROR]` を数え、`INFO <n>`・`WARN <n>`・`ERROR <n>` の 3 行を
    この順で標準出力に出す。どれも含まない行は数えない
  - 引数が無い・ファイルが読めないときは、使い方かエラーを標準エラーに出して終了コード 2

## 対象外

- 既存のファイルの変更（`src/` の他のファイル、`logs/`、ccnavi の設定）
- ログの形式の拡張（JSON、時刻の範囲指定、複数ファイル）
- 外部コマンドへの依存を増やすこと（POSIX sh と標準的なコマンドだけで書く）

## 完了の確かめ方

- フェーズ 1 の時点で `sh tests/summarize_test.sh` は、実装がまだ無いため失敗する（期待どおりに落ちることを確かめる）
- フェーズ 2 で同じテストが通る。`sh tests/summarize_test.sh` の終了コードが 0

## 計画の理由

振る舞いが新しく決まるため、受入テストを先に置いて期待する出力を固める。実装はその後に続ける。
作業が 2 ステップだけで設計判断も並行作業も要らないので、設計フェーズは置かない。
