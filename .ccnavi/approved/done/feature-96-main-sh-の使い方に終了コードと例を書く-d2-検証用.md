---
version: 1
ticket: feature-96-main-sh-の使い方に終了コードと例を書く-d2-検証用
issue: 96
mr: 97
title: main.sh の使い方に終了コードと例を書く（D2 検証用）
phases:
  quick-work:
    kind: work
    title: 小さい作業
    review: mr
    scope: inherit
    when: 設計判断や並行作業が要らないとき
plan:
- quick-work
rationale: 'main.sh は使い方の表示で引数を示すだけで、終了コードも例も書かれていない。

  スクリプトを読んだ人が、終了コードで失敗を判定できず、どう打てばよいかも分からない。

  使い方の説明を main.sh の中に揃えるための作業。動作は変えない。

  '
allow:
- match: Write|Edit
  glob: main.sh
started_at: 2026-10-25T07:39:13+0000
base_sha: b814f97e16f962f2f7ce81264d2cf71b9a1442ff
feedback: []
completed_at: "2026-10-25T07:51:11+0000"
finished_to: "done"
---
## 目的

main.sh を読むだけで、引数・終了コード・使用例が分かるようにする。

## 範囲

- main.sh の先頭コメントに、使い方・引数・終了コード（0 と 1）・例を書く
- 引数が足りないときの使い方の表示（標準エラー）に、終了コードと例の 1 行を足す

## 対象外

- 絞り込み・整形の動作、出力ファイル名、終了コードの値を変えること
- main.sh 以外のファイル（README.md、テストなど）
- 新しい引数やオプションを足すこと

## 完了の確かめ方

- `sh -n main.sh` が構文エラーなしで終わる
- `sh main.sh` を引数なしで打つと、使い方と終了コード 1 の説明が標準エラーに出て、終了コードが 1 になる
- 先頭コメントの例を 1 つ実際に打ち、`<出力の接頭辞>.txt` ができる
- 入力ファイルが無いとき、終了コードが 1 のままである

## 計画の理由

範囲が main.sh 1 ファイルで、設計判断も並行作業も要らないため、`quick-work` の 1 ステップにする。
