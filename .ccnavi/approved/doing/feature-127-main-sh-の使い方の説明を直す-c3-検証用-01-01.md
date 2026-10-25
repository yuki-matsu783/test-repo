---
version: 1
ticket: feature-127-main-sh-の使い方の説明を直す-c3-検証用-01-01
parent: feature-127-main-sh-の使い方の説明を直す-c3-検証用
title: "main.sh の冒頭の説明を直す（小さい作業）"
phase: 1
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T10:14:52+0000"
base_sha: "b5f51a349d4bcefa8e8f1fd77a9a8e286a251931"
---
## 目的

親の目的どおり、main.sh の冒頭コメントに、上書きと余分な引数の 2 点を足す。

## 範囲

- main.sh の冒頭コメント（行 4 から 19 あたり）だけ
- 追加する説明
  - 出力ファイル（`<出力の接頭辞>.txt`）は実行のたびに上書きされる
  - 引数を 3 つより多く渡しても、4 つ目以降は無視される（警告は出ない）

## 対象外

- 実行される行（`main()`・awk・終了コード）は変えない
- main.sh 以外は触らない

## 完了の確かめ方

- `sh -n main.sh` が通る
- `git diff` の差分がコメント行だけ
- `sh main.sh` を同じ出力先に 2 回打ち、2 回目で内容が置き換わる
- 引数を 4 つ渡して正常終了する
