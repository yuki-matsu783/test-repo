---
version: 1
ticket: feature-119-main-sh-の挙動を調べる-ra-検証用
issue: 119
mr: 120
human_review:
  required: true
  reason: 調査の結果を見て、次の作業（設計や実装）に進むかを決めるため
phases:
  research:
    kind: work
    title: 調査
    review: none
    scope: ["wip/research/*"]
    deliverables: ["wip/research/summary.md"]
plan:
  - research
title: main.sh の挙動を調べる（RA 検証用）
rationale: |
  issue #119 は main.sh の挙動を調べるもの。ccnavi の検証用で、コードは変えない。
  調査フェーズだけを計画に置き、結果（wip/research/summary.md）をユーザが読んでから次を決める。
  次のフェーズ（設計・実装）は、このチケットの結果を見てから別に提案する。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
main.sh の挙動を、読むことと実行して確かめることで調べ、結果を `wip/research/summary.md` にまとめる。
対象は `main.sh`（ワークスペースの直下）。`main.sh` と `README.md` の記述が食い違う箇所があれば、それも書く。
コードと README は変えない。範囲は `wip/research/*` だけ。

子は `<親>-01-01`（調査フェーズの最初の子）。子の提案は同じ `wip/proposals/todo/` に置く。
