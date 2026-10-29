---
version: 1
ticket: feature-94-h2d
issue: 94
mr: 95
title: "H2d"
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
  issue #94 の依頼。main.sh の使い方表示（引数不足時のエラー出力）に、実行例を 1 行足す。
  小さく、設計判断も並行作業も要らない。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh の使い方表示に、実行例を 1 行足す（ccnavi 検証用）。

## 範囲

- `main.sh` の `main` 関数内、引数不足時の `使い方:` 出力の直後に、実行例の行を 1 行足す（`echo ... >&2`）。
- 例の内容は、入力ファイル・絞り込みパターン・出力の接頭辞を具体的な値で示す形にする。

## 対象外

- `main` の絞り込み・整形の処理（awk 部分）は変えない。
- `README.md` は変えない（MR に既にある `<!-- 94 検証用の下書き -->` の行はそのまま残す）。

## 完了の確かめ方

- `sh main.sh` を引数なしで実行すると、従来の使い方行に加えて実行例の行が標準エラーに出て、終了コードが 1 になる。
- `sh main.sh` に引数を 3 つ渡したときの動作（入力ファイル無しのエラー、正常な出力）が変わらない。
- `sh -n main.sh` が通る。

## 計画の理由

1 ファイル・数行の変更で、前のステップに依存する並行作業も設計判断も無いため、quick-work の一直線で足りる。
