---
version: 1
ticket: feature-143-main-sh-の挙動を調べる-rb-検証用-01-01
parent: feature-143-main-sh-の挙動を調べる-rb-検証用
phase: 1
title: "main.sh の振る舞いを調べて要約にまとめる"
allow:
  - match: Write|Edit
    glob: "wip/research/*"
started_at: "2026-10-25T10:50:55+0000"
base_sha: "29748863242a6b2e711ebcac71e3b69e441bd7d2"
completed_at: "2026-10-25T10:52:28+0000"
merged_sha: "4312a478b0ce81f4ca8e8579ab94c322592ae21a"
finished_to: "review"
---
## 目的

親の目的（main.sh の挙動を確かめて要約にまとめる）を、フェーズ 1 の調査 1 作業で満たす。

## 範囲

- main.sh を読み、引数の扱い・絞り込みの条件・出力ファイル・終了コード（0 と 1）を整理する
- 振る舞いを確かめるための入力例を作り、`sh main.sh` を実際に打った結果（終了コードと出力）を残す。作るファイルは `wip/research/` の中に置く
- 結果を `wip/research/summary.md` にまとめる（成果物）

## 対象外

- main.sh の修正や機能の追加
- `wip/research/*` の外のファイルへの変更（読むことは含む）

## 完了の確かめ方

- `wip/research/summary.md` があり、引数の扱い・絞り込み・出力ファイル・終了コードの 4 点が、確かめた結果とともに書いてある
- 要約の振る舞いを、`sh main.sh` の実行結果で裏付けてある
- `git status` で、変わったファイルが `wip/research/*` の中だけである
