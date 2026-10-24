---
version: 1
ticket: feature-43-verify519-main-sh-に版表示-version-を足す
issue: 43
mr: 44
title: "verify519 main.sh に版表示 --version を足す"
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
  main.sh に --version を足し、版 0.1.0 を表示できるようにする。変更は main.sh の 1 ファイルに閉じ、設計判断も並行作業も要らないので、小さい作業として 1 ステップで進める。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

`sh main.sh --version` で版（0.1.0）を表示できるようにする。版を確かめるための小さな機能で、既存の絞り込みの動きは変えない。

## 範囲

- `main.sh` に `--version` の処理を足す。引数の先頭が `--version` のとき、`0.1.0` を標準出力に出して正常終了する
- 版の値は `main.sh` の中に 1 か所だけ書く

## 対象外

- 絞り込み・整形の処理そのものの変更
- README の更新（演習の仕様書なので、この作業では触れない）
- `--help` など、ほかのオプションの追加
- 版の番号付けの仕組み（タグや VERSION ファイルなど）の導入

## 完了の確かめ方

- `sh main.sh --version` が `0.1.0` を 1 行出し、終了コードが 0 である
- `sh main.sh` と引数が 2 つだけのときは、従来どおり使い方を出して終了コード 1 で止まる
- 従来の 3 引数の実行（絞り込みと出力）が変わらない。確かめ用の入力ファイルで、出力ファイルの中身を変更前と比べる

## 計画の理由

変更は 1 ファイル・数行で、判断が分かれる箇所が少ない。受入テストを別に立てるほどの振る舞いの変化ではないため、`quick-work` の 1 ステップで、子 1 本に実装と確認をまとめる。
