---
version: 1
ticket: feature-107-readme-に注意書きを足す-h11c-検証用
issue: 107
mr: 108
title: "README に注意書きを足す（H11c 検証用）"
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
  issue #107 は本文が「x」だけで、注意書きの文面も置く場所も指定されていない。
  README.md は演習の説明文書で、受講者が main.sh を完成させる前に読む。
  その前提を冒頭で明示する一文を足すと、読み手が迷わない。
allow:
  - match: Write|Edit
    glob: "README.md"
---
## 目的

README.md の冒頭（タイトルの直下）に、この演習の前提を示す注意書きを 1 つ足す。

## 範囲

- README.md のタイトル（`# 演習: テキスト整形CLI`）の直下に、引用ブロックで注意書きを 1 つ足す。
- 文面（案）: `> **注意**: `main.sh` の `main` 関数は TODO のままです。完成させるまで、この CLI は動きません。`

## 対象外

- 既存の本文（使い方・仕様・完成の確認）の書き換え。
- 末尾にある「テスト テスト」の 2 行と `<!-- 78 検証用の下書き -->` のコメントの扱い。これは別の判断が要るので触らない（提案の承認時に、消すかどうかを決めてもらう）。
- `main.sh` と `index.html` の変更。

## 完了の確かめ方

- `README.md` の 1〜3 行目付近に、上の注意書きが引用ブロックで入っている。
- `git diff` で変わるのは README.md の追加行だけ。
- 他のファイルに差分が出ていない。

## 計画の理由

作業は 1 ファイルの 1 箇所の追記だけで、設計判断も並行作業も要らない。よって quick-work 一本で足りる。
