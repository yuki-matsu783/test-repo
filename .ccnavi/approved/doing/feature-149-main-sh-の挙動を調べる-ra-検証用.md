---
version: 1
ticket: feature-149-main-sh-の挙動を調べる-ra-検証用
issue: 149
mr: 150
human_review:
  required: false
  reason: 調査の結果は MR のレビューで足りる
title: "main.sh の挙動を調べる（RA 検証用）"
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
  main.sh は引数の検査・絞り込み・整形・出力ファイルの作成を 1 関数に持つが、終了コードや空入力・同名出力の扱いは読んだだけでは確かめきれない。
  先に既存の振る舞いを調べて記録し、以後の判断（RA 検証の材料）に使う。動作は変えない。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
started_at: "2026-10-25T11:05:12+0000"
base_sha: "56511962abdc59d25efd7f636e56544a420eeec7"
---
## 目的

main.sh の振る舞い（引数の検査、終了コード、絞り込みパターンの扱い、出力ファイルの作り方）を、コードとの実行で確かめ、その結果を wip/research/summary.md にまとめる。

## 範囲

- 調べるもの: main.sh の引数の検査、終了コード（0 と 1）、絞り込みの一致の扱い、入力が無いときの挙動、出力ファイル（`<出力の接頭辞>.txt`）の作られ方
- 書き込めるのは `wip/research/*` だけ。成果物は `wip/research/summary.md`
- 実行して確かめてよいが、`main.sh` や他のファイルは変えない

## 対象外

- `main.sh` とリポジトリ内の他のファイルの変更（修正・整形・テストの追加）
- 結果を使った設計の提案（必要になったら別の作業として出す）

## 完了の確かめ方

- `wip/research/summary.md` があり、引数の検査・終了コード・絞り込み・出力ファイルの各項目に、実行したコマンドと結果が書かれている
- 書いた内容が、実行結果と食い違わない（記録した再現コマンドを打ち直して確かめる）

## 計画の理由

調査だけのフェーズ 1 を 1 つ置く。調べた結果を次の判断に使うため、レビューは MR で足りる（human_review は不要）。調べる範囲が 1 ファイルに絞られており、設計や実装の判断は含まない。
