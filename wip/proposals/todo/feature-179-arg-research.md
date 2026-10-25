---
version: 1
ticket: feature-179-arg-research
issue: 179
mr: 180
title: "main.sh の引数と終了コードの調査 (T7)"
phases:
  research:
    kind: work
    title: 調査
    review: none
    scope:
    - wip/research/*
    deliverables:
    - wip/research/summary.md
    when: 既存の振る舞いや依存が分からないとき。分かっているなら省略する
plan:
  - research
feedback: []
rationale: |
  main.sh は引数の数と終了コードの約束をコメントに書いているが、実際の挙動と一致するかを
  確かめていない。ccnavi の検証用に、引数と終了コードの現状を一度まとめておく。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
## 目的

main.sh（ワークスペース直下）の引数の受け方と終了コードが、ファイル先頭のコメントに書かれた約束どおりに動くかを調べ、結果を wip/research/summary.md にまとめる。コードは直さない。

## 範囲

- main.sh の読解: 引数の数の判定、入力ファイルの存在確認、絞り込みパターンの扱い（空文字・特殊文字）、出力ファイル名の作り方
- 挙動の確認: 引数が足りない場合、入力ファイルが無い場合、正常な場合、それぞれの終了コードと標準エラーの文言を実際に実行して記録する。実行は scratchpad などワークツリーの外の一時ディレクトリで行い、main.sh は変えない
- 結果を wip/research/summary.md に書く（ケースごとの入力・終了コード・出力の要点、コメントとの食い違いの有無）

## 対象外

- main.sh の修正・改善提案の実装（食い違いが見つかっても直さず、summary.md に書くだけ）
- main.sh 以外のスクリプトや、呼び出し元の調査
- テストの追加（受入テストは別の作業にする）

## 完了の確かめ方

- wip/research/summary.md があり、引数の 3 つの説明（入力ファイル・絞り込みパターン・出力の接頭辞）と終了コード 0・1 のそれぞれについて、実際に実行した結果が書かれている
- 記録した終了コードが、main.sh 先頭のコメントの「終了コード」の記述と一致するか、一致しないなら食い違いが summary.md に明記されている
- main.sh と wip/research/ 以外のファイルが変わっていない（差分が wip/research/ の中だけ）

## 計画の理由

調べものだけの作業なので、設計・実装のステップは要らず、調査の 1 ステップだけにする。調査の結果を見て、直すなら別の作業として親を立て直す。

フィードバック計画は、指摘への対応が無いので `feedback: []` とする。
