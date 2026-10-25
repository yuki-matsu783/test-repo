---
version: 1
ticket: feature-123-main-sh-の使い方の説明を直す-c1-検証用-01-01
parent: feature-123-main-sh-の使い方の説明を直す-c1-検証用
phase: 1
title: "main.sh の引数不足時の使い方の表示を直す"
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

親の目的（引数が足りないときに、main.sh の使い方と例がすぐ読めるようにする）を、フェーズ 1 の 1 作業で満たす。

## 範囲

- main.sh の `main` 関数内、引数が足りないときの標準エラー出力の 2 行目を、`例: sh main.sh access.log ERROR errors` だけの行に置き換える。自己言及の文（「引数が足りないと終了コード 1 で終わる。」）は外す

## 対象外

- 先頭コメント、絞り込み・整形の動作、出力ファイル名、終了コードの値
- main.sh 以外のファイル（README.md を含む）

## 完了の確かめ方

- `sh -n main.sh` が構文エラーなしで終わる
- `sh main.sh` を引数なしで打つと、標準エラーに「使い方: …」と「例: …」の 2 行が出て、終了コードが 1 になる
- `sh main.sh nofile ERR out` が「エラー: 入力ファイルが見つかりません: nofile」を出し、終了コードが 1 になる
