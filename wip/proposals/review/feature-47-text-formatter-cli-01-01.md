---
version: 1
ticket: feature-47-text-formatter-cli-01-01
parent: feature-47-text-formatter-cli
phase: 1
title: "main.sh の仕様照合と、ずれの修正（子 1）"
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T00:58:18+0000"
base_sha: "37b34f672e5a66103de2a69275607ef77d0b0f37"
completed_at: "2026-10-25T00:59:40+0000"
merged_sha: "50bc1657d3edbbcccda2f6855e84214cd773d529"
finished_to: "review"
---
## 目的

親 `feature-47-text-formatter-cli` の `quick-work` の子。`main.sh` を README の仕様と照合し、ずれがあれば直す。

## 範囲

- `main.sh` のみ（子のワークツリーの中）。
- 親の提案の「完了の確かめ方」の 1〜5 を満たすこと。

## 対象外

- 親の範囲の外（`README.md` など）への変更。親のワークツリーへの書き込み。
- 整形ルールの変更。

## 完了の確かめ方

親の提案の「完了の確かめ方」に従う。結果（各項目の成否と実際の出力）を完了の報告に書く。ずれが無ければ、コードは変えずに確かめた結果だけを報告する。
