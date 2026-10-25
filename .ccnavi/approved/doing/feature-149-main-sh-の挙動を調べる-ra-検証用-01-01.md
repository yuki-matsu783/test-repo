---
version: 1
ticket: feature-149-main-sh-の挙動を調べる-ra-検証用-01-01
parent: feature-149-main-sh-の挙動を調べる-ra-検証用
phase: 1
human_review:
  required: false
  reason: 調査の結果は MR のレビューで足りる
title: "main.sh の振る舞いを調べて summary.md にまとめる"
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
## 目的

フェーズ 1（調査）の 1 作業で、親の目的（main.sh の振る舞いを確かめて記録する）を満たす。

## 範囲

- `main.sh` を読み、次の項目について、実行したコマンドと結果を調べる
  - 引数が足りないときの挙動（使い方の表示、終了コード）
  - 入力ファイルが無いときの挙動（エラー文、終了コード）
  - 絞り込みパターンを含む行の残り方、空のパターンの扱い、一致する行が無いときの出力
  - 出力ファイル（`<出力の接頭辞>.txt`）の作られ方と、行番号・行頭の空白の扱い
- 調べるために作る一時ファイルは `wip/research/*` の中だけに置く
- 成果物は `wip/research/summary.md`。項目ごとに、確かめたこと・実行したコマンド・結果を書く

## 対象外

- `main.sh` とリポジトリ内の他のファイルの変更
- 調べた結果を基にした修正や設計の提案
- `wip/research/*` 以外への書き込み

## 完了の確かめ方

- `wip/research/summary.md` が、上の 4 項目を網羅している
- 各項目に、実行したコマンドと結果（終了コードを含む）が書かれている
- `main.sh` と他のファイルに差分が無い（`ccnavi-git.sh diff` で確かめる）
