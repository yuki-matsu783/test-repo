---
version: 1
ticket: feature-39-test-repo-readme-の末尾に-1-行を足す-受け入れシナリオ-01-01
parent: feature-39-test-repo-readme-の末尾に-1-行を足す-受け入れシナリオ
phase: 1
human_review:
  required: true
  reason: README.md の 1 行追加。レビューで確かめる
title: README の末尾に「テスト 2」と 1 行足す
rationale: |
  issue #39 の指定の作業。README.md の末尾に「テスト 2」と 1 行足す。
allow:
  - match: Write|Edit
    glob: "README.md"
started_at: ""
completed_at: ""
base_sha: ""
---
## 背景

issue #39 で、README.md の末尾に「テスト 2」と 1 行足す作業が指定された。

## 変更の内容

- README.md の末尾に「テスト 2」と 1 行足す（既存の行は変えない）
