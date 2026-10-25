---
version: 1
ticket: feature-141-main-sh-の挙動を調べる-ra-検証用-01-01
parent: feature-141-main-sh-の挙動を調べる-ra-検証用
phase: 1
title: "main.sh の挙動を読み、実行して確かめ、summary.md にまとめる"
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
## 目的

親の目的（`main.sh` の挙動を読解と実行で確かめる）を、フェーズ 1 の調査 1 作業で満たし、`wip/research/summary.md` を残す。

## 範囲

- `main.sh` と `README.md` を読み、仕様と実装の食い違いを洗い出す
- 次の場面を実際に打ち、終了コードと出力を記録する: 引数が足りない、入力ファイルが無い、一致する行が無い、絞り込みパターンが空、パターンに `\` や `%` を含む
- 実行の出力は `wip/research/` の中に作る（`cd wip/research` してから打つ）
- 結果を `wip/research/summary.md` にまとめる

## 対象外

- `main.sh` と `README.md` の書き換え
- テストの追加
- `wip/research/` 以外のファイルの編集

## 完了の確かめ方

- `wip/research/summary.md` があり、引数・終了コード・絞り込み・番号の振り方・出力先の挙動が書かれている
- 各記述に、読解で分かったことか、実行して確かめたことかが分かる書き方がある
- README と実装の食い違いがあれば、その箇所と違いが書かれている（無ければ「無い」と書く）
