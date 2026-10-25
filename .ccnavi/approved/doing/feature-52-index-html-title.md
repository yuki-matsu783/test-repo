---
version: 1
ticket: feature-52-index-html-title
issue: 52
mr: 55
title: "index.html のタイトルを「演習」に変える（ccnavi 検証 T2）"
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
  issue #52 の指定どおり、index.html の title 要素だけを「演習」に変える。設計判断も並行作業も要らない一行の変更。
allow:
  - match: Write|Edit
    glob: "index.html"
started_at: "2026-10-25T04:05:32+0000"
base_sha: "9a036b2f5d9f28d9fdc4ef9418f3927f37e637d9"
---
## 目的

index.html の `<title>` を「サンプルメモアプリ」から「演習」に変える（issue #52）。

## 範囲

- `index.html` の `<title>` 要素の文字列のみ。

## 対象外

- 画面上の見出し `<h1>サンプルメモアプリ</h1>` は変えない（issue は title だけを指定しているため）。
- スクリプト・スタイル・他ファイルは触らない。

## 完了の確かめ方

- `index.html` の `<title>` が `演習` になっていること（`grep -n '<title>' index.html` で確かめる）。
- 差分が `<title>` 行の一行だけであること（`git diff --stat` で確かめる）。

## 計画の理由

変更が一行で、範囲が index.html に閉じ、設計判断が要らないため quick-work にする。
