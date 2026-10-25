---
version: 1
ticket: feature-159-main-sh-の使い方コメントに戻り値の例を-1-行足す
issue: 159
mr: 160
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
  main.sh の先頭コメントには引数と終了コードの説明はあるが、入力ファイルが無いときに実際に何が出て終了コードがいくつになるかの具体例が無い。
  変更は main.sh の先頭コメントの 1 行だけで、設計判断も他の作業との並行も要らないため、小さい作業 1 件で足りる。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh を読むだけで、戻り値（標準エラーに出る文言と終了コード）の具体例が分かるようにする。

## 範囲

- main.sh の先頭コメントの「例」の節に、入力ファイルが無いときの戻り値の例を 1 行足す（例: `sh main.sh missing.log ERROR errors` → 「エラー: 入力ファイルが見つかりません: missing.log」を標準エラーに出し、終了コード 1 で終わる）

## 対象外

- main.sh の処理内容・絞り込みの動作・出力ファイル名・終了コードの値（コードは変えない）
- main.sh 以外のファイル

## 完了の確かめ方

- `sh -n main.sh` が構文エラーなしで終わる
- 追加した例の入力ファイルを存在しない名前にして `sh main.sh <存在しない名前> ERROR errors` を打ち、コメントに書いた文言と終了コード 1 が実際に一致する
- `git diff` で変わるのは main.sh のコメント行だけ

## 計画の理由

作業は 1 ファイルのコメント追加だけで、設計・調査・受入テストを挟む必要がない。範囲も親の範囲そのまま（main.sh）に収まるため、小さい作業 1 ステップにする。
