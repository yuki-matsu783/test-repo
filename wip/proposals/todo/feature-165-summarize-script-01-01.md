---
version: 1
ticket: feature-165-summarize-script-01-01
parent: feature-165-summarize-script
phase: 1
title: "受入テスト作成: tests/summarize_test.sh を書く（実装はまだ無い）"
rationale: |
  src/summarize.sh の期待する振る舞いを、先にテストで固める。実装はフェーズ 2 の子が書く。
allow:
  - match: Write|Edit
    glob: "tests/summarize_test.sh"
---
## 目的

`src/summarize.sh` の期待する振る舞いを `tests/summarize_test.sh` に書く。
この時点では `src/summarize.sh` は存在しないので、テストは失敗するのが正しい。

## 範囲

- `tests/summarize_test.sh`（新規）だけ。`src/` には触れない

テストが確かめること（親の提案の「想定する振る舞い」に従う）:

- `[INFO]`・`[WARN]`・`[ERROR]` の行数を `INFO <n>`・`WARN <n>`・`ERROR <n>` の順で出す
- どのレベルも含まない行は数えない
- 引数なし、または読めないファイルのときは、終了コード 2 で標準エラーに何か出す
- テストは一時ファイルを使い、終わったら消す。成功なら終了コード 0、失敗があれば 1

## 対象外

- `src/summarize.sh` の実装（フェーズ 2）
- 既存のテストやテストの仕組みの変更

## 完了の確かめ方

- `sh tests/summarize_test.sh` が文法エラーなく動き、`src/summarize.sh` が無いことによる失敗で終わる（終了コード 1）
- テストの各ケースに、確かめる内容が名前か短い説明で分かる
