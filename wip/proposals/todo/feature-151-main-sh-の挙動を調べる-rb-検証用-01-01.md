---
version: 1
ticket: feature-151-main-sh-の挙動を調べる-rb-検証用-01-01
parent: feature-151-main-sh-の挙動を調べる-rb-検証用
phase: 1
title: "main.sh の挙動を調べて wip/research/summary.md にまとめる"
human_review:
  required: false
  reason: 調査の結果は MR のレビューで足りる
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
## 目的

main.sh の引数・入力・出力・終了コードの扱いを、コードと実行結果で確かめ、`wip/research/summary.md` にまとめる。

## 範囲

- main.sh を読み、次を整理する: 引数の数の判定、入力ファイルの存在の判定、絞り込みパターンの扱い（空文字、`\` を含む文字列）、出力ファイル名の作り方、終了コード（0 と 1）
- main.sh を、リポジトリの外（ワークスペースの scratchpad など）に作った入力ファイルで実行し、読んで分かったことを実際に確かめる。実行したコマンドと結果の抜粋を要約に載せる
- `wip/research/summary.md` に、分かったこと・確かめた方法・分からなかったことを書く

## 対象外

- main.sh と、リポジトリの他のファイルを直すこと（読むだけ）
- `wip/research/` の外に書くこと
- 挙動の改善・仕様の変更を実装すること（必要なら要約に提案として書くだけにする）

## 完了の確かめ方

- `wip/research/summary.md` があり、分かったこと・確かめた方法・分からなかったことの 3 つが書かれている
- 挙動の記述は、打った実行結果と突き合わせてある。読んだだけで確かめていない点は「未確認」と書く
- MR の差分が `wip/research/` の中だけである
