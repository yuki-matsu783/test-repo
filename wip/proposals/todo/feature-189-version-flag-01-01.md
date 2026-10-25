---
version: 1
ticket: feature-189-version-flag-01-01
parent: feature-189-version-flag
phase: 1
title: main.sh に --version を足す（小さい作業）
human_review:
  required: true
  reason: 引数の処理に分岐を足すため、既存の使い方を壊していないかを見てほしい
allow:
  - match: Write|Edit
    glob: "main.sh"
  - match: Write|Edit
    glob: "tests/*"
  - match: Write|Edit
    glob: "docs/wiki/*"
  - match: Write|Edit
    glob: ".claude/skills/*"
---
`main.sh` に `--version` の分岐を足し、版の文字列を 1 か所で持つ。
`tests/*` に `--version` と既存の終了コード（引数不足・入力ファイル無しは 1）を確かめるテストを足す。
`main.sh` の使い方に触れている文書が `docs/wiki/*` か `.claude/skills/*` にあれば、`--version` を 1 行足す。無ければ触らない。
絞り込み・整形の処理と、ほかのオプションは変えない。
