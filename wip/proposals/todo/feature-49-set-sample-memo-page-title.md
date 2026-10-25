---
version: 1
ticket: feature-49-set-sample-memo-page-title
issue: 49
mr: 50
title: "Set sample memo page title"
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
  index.html の <title> が「サンプルメモ」になっていない。表示名を揃えるだけの小さい変更。
allow:
  - match: Write|Edit
    glob: "index.html"
---
## 目的

index.html の `<title>` を「サンプルメモ」に変える。

## 範囲

- `index.html` の `<title>` 要素の文字列だけを「サンプルメモ」にする。

## 対象外

- `index.html` の他の要素・スタイル・スクリプトの変更。
- ほかのファイル（README・他ページ）の変更。

## 完了の確かめ方

- `index.html` の `<title>` が「サンプルメモ」になっている（`grep -n '<title>' index.html` で確かめる）。
- 差分が `<title>` の 1 行だけである（`git diff` で確かめる）。

## 計画の理由

作業は 1 つのファイルの 1 行だけで、設計判断も並行作業も要らない。フェーズは 1 つ（小さい作業）にし、レビューは MR で受ける。
