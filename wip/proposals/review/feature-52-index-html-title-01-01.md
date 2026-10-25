---
version: 1
ticket: feature-52-index-html-title-01-01
parent: feature-52-index-html-title
phase: 1
title: "index.html の title を「演習」に変える（ccnavi 検証 T2 の子）"
allow:
  - match: Write|Edit
    glob: "index.html"
rationale: |
  親 feature-52 の計画「小さい作業」（quick-work）の 1 段階。index.html の <title> の 1 行を変えるだけ。
started_at: "2026-10-25T04:16:17+0000"
base_sha: "4000cfe0dd8524fa5a8864d997198252f14eb97e"
completed_at: "2026-10-25T04:20:27+0000"
merged_sha: "8cbfdbb12ef84f921c3819e24cb4c672f5707ce3"
finished_to: "review"
---
## 目的

親 feature-52 の範囲どおり、index.html の `<title>` を「サンプルメモアプリ」から「演習」に変える（issue #52）。

## 範囲

- `index.html` の `<title>` 要素の文字列だけ。`<title>サンプルメモアプリ</title>` を `<title>演習</title>` にする。

## 対象外

- 画面上の見出し `<h1>サンプルメモアプリ</h1>`。issue が title だけを指定しているため変えない。
- `index.html` のほかの行、スクリプト・スタイル、ほかのファイル。

## 完了の確かめ方

- `grep -n '<title>' index.html` で `<title>演習</title>` になっていること。
- `git diff --stat` で、差分が `index.html` の 1 行（+1 -1）だけであること。

## 計画の理由

親の計画は `quick-work` の 1 段階だけなので、子も 1 本にする。作業は 1 ファイルの 1 行の変更。
