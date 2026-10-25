---
version: 1
ticket: feature-104-main-sh-の使い方の表示を-1-行足す-c3-検証用
issue: 104
mr: 105
title: "main.sh の使い方の表示を 1 行足す（C3 検証用）"
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
  main.sh は引数が足りないときに使い方を標準エラーへ出すが、出力の接頭辞からどのファイルができるかは書かれていない。
  使い方の表示に 1 行足して、打つ前に出力先が分かるようにする。範囲は main.sh 1 ファイルで、設計判断も並行作業も要らないため quick-work の 1 ステップにする。
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T08:14:38+0000"
base_sha: "8cc972b2ae4e817d95f1c5fec6bf1ad83b9c119b"
---
## 目的

main.sh の使い方の表示を見ただけで、出力ファイル名（`<出力の接頭辞>.txt`）が分かるようにする。

## 範囲

- main.sh の引数不足の使い方の表示（標準エラー）に、出力先を示す 1 行を足す
  - 例: `出力: <出力の接頭辞>.txt に、絞り込んだ行を番号付きで書く`

## 対象外

- 絞り込み・整形の動作、出力ファイル名、終了コードの値を変えること
- 先頭コメントやエラーメッセージの既存の行を書き換えること
- main.sh 以外のファイル（README.md、index.html、テストなど）

## 完了の確かめ方

- `sh -n main.sh` が構文エラーなしで終わる
- `sh main.sh` を引数なしで打つと、足した 1 行を含む使い方が標準エラーに出て、終了コードが 1 のままである
- 例 `sh main.sh access.log ERROR errors` を打ち、`errors.txt` ができる（動作が変わっていないこと）

## 計画の理由

範囲が main.sh 1 ファイルで、設計判断も並行作業も要らないため、`quick-work` の 1 ステップにする。子は `<親>-01-01` の 1 つだけ。
