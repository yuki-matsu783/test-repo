---
version: 1
ticket: feature-183-arg-research3
issue: 183
mr: 184
title: main.sh の引数と終了コードの調査 (T7c)
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
rationale: 'main.sh の引数の扱いと終了コードが、冒頭のコメントに書かれた仕様どおりに動くかを、

  実際に動かして確かめる。後続の作業（不具合の修正や仕様の書き換え）を決める前に、

  現状の振る舞いを事実として残す必要がある。

  '
allow:
- match: Write|Edit
  glob: wip/research/*
started_at: 2026-10-25T18:47:07+0000
base_sha: 9cb077bbd0786895e35206a310a5e21dd1666624
feedback: []
completed_at: "2026-10-25T19:03:01+0000"
finished_to: "done"
---
## 目的

main.sh の引数の数の判定、入力ファイルの存在の判定、終了コード（0 と 1）が、
冒頭コメントの仕様どおりかを確かめ、結果を wip/research/summary.md にまとめる。
コードは変えない。

## 範囲

- main.sh を読み、引数の検査・入力ファイルの検査・awk による絞り込みと出力の流れを整理する
- 引数が足りない場合、入力ファイルが無い場合、正常な場合の 3 系統を実行して、
  終了コードと標準出力・標準エラーの内容を記録する
- 絞り込みパターンが空のとき、特殊文字を含むとき、出力の接頭辞に拡張子が付くときの振る舞いを記録する
- 結果を wip/research/summary.md に書く（確かめた入力、実行したコマンド、観測した結果）

## 対象外

- main.sh・README.md・index.html の変更（読むだけ）
- 仕様の書き換えや不具合の修正の提案（見つけたら summary.md に事実として書き、判断はユーザに任せる）
- 実行で作るファイルは、リポジトリの中に残さない（scratchpad か一時ディレクトリで実行する）

## 完了の確かめ方

- wip/research/summary.md があり、3 系統と追加の系統の実行結果（コマンド・終了コード・出力）が書かれている
- summary.md に書いた終了コードを、もう一度同じコマンドで打って一致することを確かめる
- git の差分が wip/research/ の外に出ていないことを、ccnavi-git.sh の status で確かめる

## 計画の理由

調べものだけの作業なので、設計と実装は計画に入れない。結果を見てから、
次に何をするかをユーザと決める。
