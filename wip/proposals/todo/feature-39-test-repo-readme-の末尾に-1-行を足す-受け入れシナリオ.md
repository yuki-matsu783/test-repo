---
version: 1
ticket: feature-39-test-repo-readme-の末尾に-1-行を足す-受け入れシナリオ
issue: 39
mr: 40
title: "README の末尾に 1 行を足す（受け入れシナリオ UC-09 用）"
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
  issue #39 の指定で、README.md の末尾に 1 行を足す小さい作業。受け入れシナリオ UC-09 の材料にする。
allow:
  - match: Write|Edit
    glob: "README.md"
---
## 背景

issue #39 で、README.md の末尾に 1 行を足す作業が指定された。設計判断は要らない。

## 変更の内容

- README.md の末尾に「テスト 2」と 1 行足す（既存の行は変えない）

## デメリット

- 無し。README.md 以外は触らない

## 計画の理由

設計判断や並行作業が要らない小さい作業なので、quick-work（1 フェーズ）にする。
