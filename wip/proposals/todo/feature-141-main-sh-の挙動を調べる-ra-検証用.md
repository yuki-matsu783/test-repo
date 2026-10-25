---
version: 1
ticket: feature-141-main-sh-の挙動を調べる-ra-検証用
issue: 141
mr: 142
title: "main.sh の挙動を調べる（RA 検証用）"
human_review:
  required: false
  reason: 調査の結果は MR のレビューで足りる
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
plan:
  - research
rationale: |
  main.sh の引数・終了コード・絞り込み・出力の振る舞いを、README と実装の読解だけでなく実際に打って確かめ、後の作業（使い方の追記など）の土台にする。調査は 1 段で閉じるので、計画は research の 1 ステップにする。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
## 目的

`main.sh` の挙動（引数の扱い、終了コード、絞り込み、番号の振り方、出力先）を、読解と実行の両方で確かめ、`wip/research/summary.md` にまとめる。

## 範囲

- `main.sh` と `README.md` を読み、仕様と実装の食い違いを洗い出す
- 引数が足りない・入力が無い・一致する行が無い・パターンが空、などの場面で実際に打ち、終了コードと出力を記録する
- 実行の出力は `wip/research/` の中に作る（`cd wip/research` してから打つ）
- 結果を `wip/research/summary.md` に書く

## 対象外

- `main.sh` と `README.md` の書き換え（TODO の実装や使い方の追記は、後の作業）
- テストの追加
- `wip/research/` 以外のファイルの編集

## 完了の確かめ方

- `wip/research/summary.md` があり、引数・終了コード・絞り込み・番号の振り方・出力先の挙動が書かれている
- 各記述に、読解で分かったことか、実行して確かめたことかが分かる書き方がある
- README と実装の食い違いがあれば、その箇所と違いが書かれている（無ければ「無い」と書く）

## 計画の理由

挙動は実装を読めば大半が分かるが、空パターンや特殊な文字の扱いは実際に打たないと確かめられない。調査は 1 段で閉じ、レビューは親の MR で足りるので、計画は research の 1 ステップにする。
