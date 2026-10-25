---
version: 1
ticket: feature-173-main-sh-の使い方コメントに戻り値の例を-1-行足す
issue: 173
mr: 174
title: "main.sh の使い方コメントに戻り値の例を 1 行足す"
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
  main.sh の使い方コメントには引数と終了コードの説明はあるが、正常終了したときに何が出るかの例が無い。
  1 行の例を足して読み手の理解を助ける。振る舞いは変えない。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh の使い方コメントを読んだ人が、正常終了時の結果をすぐ想像できるようにする。

## 範囲

- main.sh の冒頭コメントの「例:」の節に、戻り値（終了コード 0 のとき）の例を 1 行足す
- 足すのはコメントの 1 行だけ

## 対象外

- main.sh の処理・引数の扱い・出力内容は変えない
- 他のファイル（README など）には触れない

## 完了の確かめ方

- `sh -n main.sh` が構文エラーなく通る
- 追加した行がコメントであり、コードの行が増えていない（`git diff` で確かめる）
- `sh main.sh <入力> <パターン> <接頭辞>` の実行結果が、変更前と変わらない

## 計画の理由

作業は 1 枚の子で足りる。コメント 1 行の変更で、設計判断も並行作業も要らないため quick-work の一直線にする。
