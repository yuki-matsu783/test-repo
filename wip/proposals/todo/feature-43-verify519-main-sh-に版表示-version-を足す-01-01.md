---
version: 1
ticket: feature-43-verify519-main-sh-に版表示-version-を足す-01-01
parent: feature-43-verify519-main-sh-に版表示-version-を足す
phase: 1
title: "main.sh に --version を足して 0.1.0 を表示する"
rationale: |
  親の計画は quick-work の 1 ステップなので、実装と確認をこの子 1 本にまとめる。範囲は親の範囲（main.sh）のとおり。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

`main.sh` の引数の先頭が `--version` のとき、版 `0.1.0` を 1 行出して終了コード 0 で終わるようにする。

## 範囲

- `main.sh` の `main` の先頭で、`--version` を判定して `0.1.0` を標準出力に出し、終わる処理を足す
- 版の値は `main.sh` の中に 1 か所だけ書く（変数などにまとめる）

## 対象外

- 絞り込み・整形の処理そのもの
- README などほかのファイル（親の範囲の外）
- `--help` など、ほかのオプション

## 完了の確かめ方

- `sh main.sh --version` が `0.1.0` を 1 行出し、終了コードが 0 である
- `sh main.sh` のように引数が足りないときは、従来どおり使い方を出して終了コード 1 で止まる
- 確かめ用の入力ファイルで `sh main.sh <入力> <パターン> <接頭辞>` を実行し、出力ファイルが変更前と同じ内容になる（変更前のコミットの出力と比べる）

## 計画の理由

親の計画 `quick-work` の 1 ステップを、この子 1 本で実装する。変更は 1 ファイル・数行で、子が完了すると親の範囲のすべてが済む。
