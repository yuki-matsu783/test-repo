---
version: 1
ticket: feature-74-main-sh-の使い方に終了コードを書く-h6-検証用
issue: 74
mr: 75
title: "main.sh の使い方に終了コードを書く（H6 検証用）"
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
  直接作業で main.sh の使い方メッセージに終了コード（1）を書く変更をしたが、
  この変更は使い方メッセージの文言（外から見える出力）を変えるので、設計に触れる。
  そのため直接作業ではなく、issue #74 に結び付けたチケット作業として進め直す。
  範囲は main.sh の 1 ファイルだけで、design 定義の範囲（wip/design/*・docs/*）と
  implement 定義の範囲（src/*・tests/*）は main.sh を含まない。プロジェクトの
  phases.yml を直さずに進めるため、親の範囲を main.sh に絞れる quick-work を使う。
  変更の判断（文言に終了コードを書くか）は、このチケットの目的と完了の確かめ方で
  レビューしてもらう。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh の使い方メッセージ（引数が足りないときに出す行）に、終了コード（1）を書く。
使い方を見た人が、この失敗が終了コード 1 で返ることを文言から知れるようにする。

## 範囲

- main.sh の使い方メッセージの 1 行（`echo "使い方: ..." >&2` の行）だけを変える。
- 変える文言は `使い方: sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>（終了コード 1）`。
- 終了コードの値（`exit 1`）と、引数の判定は変えない。

## 対象外

- main.sh の引数の判定・終了コードの値・ほかの出力の文言。
- テストの追加（既存の振る舞いは変わらないため、このチケットでは増やさない）。
- 直接作業の worktree（fix-1-main-usage-exit-code）の変更は、このチケットが取り込まれるまで消さない。

## 完了の確かめ方

- `sh main.sh` を引数なしで実行し、使い方の行に「（終了コード 1）」が出て、終了コードが 1 であること。
- `git diff` で変わるのが main.sh の 1 行だけであること。

## 計画の理由

設計に触れるので、直接作業ではなくチケットでレビューを受ける。計画は範囲が main.sh だけに
収まる quick-work にした（design / implement の定義は main.sh を範囲に持たないため）。
