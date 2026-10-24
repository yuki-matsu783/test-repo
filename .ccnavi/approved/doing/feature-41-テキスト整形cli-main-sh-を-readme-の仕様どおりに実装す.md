---
version: 1
ticket: feature-41-テキスト整形cli-main-sh-を-readme-の仕様どおりに実装す
issue: 41
mr: 42
title: テキスト整形CLI（main.sh）を README の仕様どおりに実装する
phases:
  quick-work:
    kind: work
    title: 小さい作業
    review: mr
    scope: inherit
    when: 設計判断や並行作業が要らないとき
plan:
- quick-work
rationale: 'README.md の仕様どおりに main.sh の TODO を完成させる作業。演習用の小さな CLI で、設計判断も並行作業も要らないので、quick-work
  を 1 段だけ置く。

  '
allow:
- match: Write|Edit
  glob: main.sh
started_at: 2026-10-24T20:08:07+0000
base_sha: 28ea7230c50bb2db27e65c5b8cc8fc543b9da596
feedback: []
---
## 目的

README.md の仕様どおりに、`main.sh` の `main` 関数（TODO の箇所）を実装する。入力ファイルから絞り込みパターンを含む行だけを残し、行頭の空白を除いて番号を振り、`<出力の接頭辞>.txt` に書き出す。

## 範囲

`main.sh` だけ。`main` 関数の中身と、そのための補助関数に限る。

## 対象外

- `README.md` の変更（「テスト」の行には触れない）
- `main.sh` 以外のファイル
- 整形の仕様をほかに増やすこと（今回は「行頭の空白を除く」「番号を振る」の 2 つだけ）

## 完了の確かめ方

手元で `sh main.sh` を次の場合に実行して確かめる。

- 引数が足りないとき、使い方を表示して終了する（終了コードは 0 以外）
- 入力ファイルが無いとき、エラーで終了する（終了コードは 0 以外）
- 一致する行があるとき、その行だけを番号つきで `<接頭辞>.txt` に書き出す（作業ディレクトリに作る）
- 一致する行が無いとき、空の `<接頭辞>.txt` を作って正常終了する（終了コードは 0）

## 計画の理由

小さな作業で、設計判断も並行して進める部分も無い。`quick-work` の 1 段で、親 1 つに子 1 つ（`-01-01`）で回す。
