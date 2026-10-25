---
version: 1
ticket: feature-151-main-sh-の挙動を調べる-rb-検証用
issue: 151
mr: 152
title: "main.sh の挙動を調べる（RB 検証用）"
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
human_review:
  required: false
  reason: 調査の結果は MR のレビューで足りる
rationale: |
  main.sh の振る舞い（引数の扱い、終了コード、絞り込みと番号付けの細部）を、コードを読んで確かめたい。
  ccnavi の RB（ルール検証）用に、調査フェーズだけを持つ親を立てて、調査の結果を MR で確かめられるかを見る。
  このフェーズは調べるだけで、main.sh には触れない。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
## 目的

main.sh が引数・入力・出力・終了コードをどう扱うかを、コードと実行結果から確かめて、後の作業が読める要約にする。

## 範囲

- main.sh を読み、引数の数の判定、入力ファイルの存在の判定、絞り込みパターンの扱い（空文字、`\` を含む文字列）、出力の作り方、終了コードを整理する
- main.sh を、リポジトリの外（ワークスペースの scratchpad など）に作った入力ファイルで実行し、読んで分かったことが実際に出るかを確かめる。実行結果の抜粋は要約に載せる
- 結果を `wip/research/summary.md` に書く（分かったこと・確かめた方法・分からなかったこと）

## 対象外

- main.sh と、リポジトリの他のファイルを直すこと（読むだけ）
- 調査の成果を `wip/research/` の外に書くこと
- 挙動の改善・仕様の変更の提案を実装すること（必要なら要約に書き、別の提案にする）

## 完了の確かめ方

- `wip/research/summary.md` があり、次の 3 つが書かれている: 分かったこと（挙動の一覧）・確かめた方法（実行したコマンドと入力）・分からなかったこと
- 要約の挙動の記述は、実際に打った実行結果と突き合わせてある（読んだだけの推測には「未確認」と書く）
- MR の差分が `wip/research/` の中だけである

## 計画の理由

調査 1 フェーズで完結し、設計判断も並行作業も要らないため、`research` の 1 ステップにする。成果は要約 1 本で、レビューは MR で足りる。
