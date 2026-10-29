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
    when: 既存の振る舞いや依存が分からないとき。分かっているなら省略する
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
started_at: "2026-10-25T09:53:30+0000"
base_sha: "260120afae8583c95182105abe048cee63d47a9c"
---

## 目的

`main.sh` の挙動を、読むことと実行して確かめることで調べ、結果を `wip/research/summary.md` にまとめる。
ccnavi の検証用で、コードは変えない。

## 範囲

- 対象は `main.sh`（ワークスペースの直下）。`main.sh` と `README.md` の記述が食い違う箇所があれば、それも書く
- 書いてよいのは `wip/research/*` だけ（子の範囲も同じ）

## 対象外

- `main.sh` と `README.md` の変更
- 設計や実装（次の作業として、結果を見てから別に提案する）

## 完了の確かめ方

子 `<親>-01-01` が `wip/research/summary.md` を書き、そこに挙がった 7 項目すべてに結果が付いていること。

## 計画の理由

調査フェーズだけを計画に置く。結果をユーザが読んでから、設計や実装に進むかを決める。
子の提案は同じ `wip/proposals/todo/` に置いてある。
