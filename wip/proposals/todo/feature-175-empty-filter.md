---
version: 1
ticket: feature-175-empty-filter
issue: 175
mr: 176
title: "main.sh が絞り込みパターン空のとき全行を出さず落ちる（原因不明）。調べて直す"
phases:
  research:
    kind: work
    title: 調査
    review: none
    scope:
    - wip/research/*
    deliverables:
    - wip/research/summary.md
    when: 既存の振る舞いや依存が分からないとき。分かっているなら省略する
  implement:
    kind: work
    title: 実装とテスト
    review: mr
    scope:
    - src/*
    - tests/*
    when: 振る舞いを変えるとき。受入テスト作成を先に置く（計画に受入テスト作成の項も置く）
plan:
  - research
  - {type: implement, after: [1]}
rationale: |
  issue #175 は「main.sh が絞り込みパターン空のとき全行を出さず落ちる気がする（原因不明）」という報告。
  今の main.sh は空パターンで全行を出して終了コード 0 になり、手元の再現では落ちなかった（dash・mawk、空入力・末尾改行なし・空白入りの出力先）。
  再現条件が確定していないので、先に調査で条件と原因を確かめ、そのあとで直す。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
  - match: Write|Edit
    glob: "src/*"
  - match: Write|Edit
    glob: "tests/*"
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh の絞り込みパターンが空のとき、全行を出さずに落ちる不具合の原因を特定し、直す。

## 範囲

- 調査（フェーズ 1）: 落ちる条件を再現し、原因を `wip/research/summary.md` に書く
- 実装（フェーズ 2）: 原因を直す。main.sh の絞り込み部分と、再現に使う自動テスト

## 対象外

- 空パターンは全行を出す、という既存の仕様は変えない
- 引数不足・入力ファイル無しの終了コード（1）と使い方の表示は変えない
- main.sh 以外の文書や設定は変えない

## 完了の確かめ方

- 調査: 落ちる条件（シェル・awk の種類、入力の形、引数の渡し方など）が再現手順つきで `wip/research/summary.md` に書かれている
- 実装: 空パターンで全行が出て終了コード 0 になることを自動テストで確かめる。空入力・末尾改行なし・空白を含むパターンでも正しく動く
- 既存の使い方（引数不足・入力ファイル無し）の終了コードと表示が変わっていない

## 計画の理由

今の main.sh では落ちる条件を再現できなかった。原因が分かっていない不具合なので、直す前に調べて条件を確定させる（bugfix の型）。
