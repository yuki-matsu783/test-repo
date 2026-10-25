---
version: 1
ticket: feature-137-main-sh-に-verbose-オプションを足す
issue: 137
mr: 138
title: "main.sh に --verbose オプションを足す"
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
  design:
    kind: work
    title: 設計
    review: mr
    scope:
    - wip/design/*
    - docs/*
    deliverables:
    - wip/design/*.md
    when: 変更箇所が 3 か所を超えるか、外から見える振る舞いが変わるとき
  acceptance:
    kind: work
    title: 受入テスト作成
    review: mr
    scope:
    - tests/*
    when: 振る舞いが変わるとき。実装と並行してよい（実装のステップの `after` にこのステップを書かなければ並行する）
  implement:
    kind: work
    title: 実装とテスト
    review: mr
    scope:
    - src/*
    - tests/*
    when: 振る舞いを変えるとき。受入テスト作成を先に置く（計画に受入テスト作成の項も置く）
  quick-work:
    kind: work
    title: 小さい作業
    review: mr
    scope: inherit
    when: 設計判断や並行作業が要らないとき
plan:
  - research
  - {type: design, after: [1]}
  - {type: acceptance, after: [2]}
  - {type: implement, after: [2]}
  - {type: quick-work, after: [3, 4]}
rationale: |
  main.sh は引数の解釈と処理の経過が見えず、うまくいかないときに原因を追いにくい。
  --verbose を足して、入力・絞り込みパターン・一致行数・出力先を標準エラーに出せるようにする。
  既定の出力（<出力の接頭辞>.txt の中身と終了コード）は変えない。
  調査で既存の振る舞いを確かめ、設計で引数の形と出力の中身を決めてから、受入テストと実装を並行して作る。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
  - match: Write|Edit
    glob: "wip/design/*"
  - match: Write|Edit
    glob: "tests/*"
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh に `--verbose` オプションを足す。付けたときだけ、処理の経過（入力ファイル・絞り込みパターン・一致した行数・出力先）を標準エラーに出す。

## 範囲

- main.sh の引数の解釈（`--verbose` の受け取り）と、経過の出力
- 受入テスト（tests/ 以下）。`--verbose` あり・なしの両方を見る
- 調査の結果（wip/research/summary.md）と設計（wip/design/*.md）

## 対象外

- 既定の出力（`<出力の接頭辞>.txt` の中身と終了コード）は変えない
- README の使い方の書き換え、`--help` や `--version` の追加（別の作業）
- 経過の出力を標準出力や出力ファイルへ混ぜること

## 完了の確かめ方

- 受入テストが通る（`--verbose` あり・なしで、経過が標準エラーに出る・出ない、出力ファイルの中身が同じ）
- 既存の振る舞いが変わらない（引数不足で終了コード 1、入力が無いときはエラー、一致が無いときは空の出力ファイル）
- 受入テストを、実装より先に書いた状態で失敗することを確かめてから実装する

## 計画の理由

- 調査: main.sh の現在の振る舞いと終了コードを確かめる（既存の挙動を崩さないため）
- 設計: `--verbose` の置き場所（先頭のみにするか）と、経過の出し方（標準エラーに、何を出すか）を決める。変更箇所が複数に分かれ、外から見える挙動が増えるため
- 受入テストと実装: 設計の後に、どちらも設計だけを前提に並行して作る。受入テストは実装の完成を待たずに、仕様どおりの振る舞いを先に固める
- 最後の段（小さい作業）: 並行した受入テストと実装を突き合わせ、受入テストを実装に当てて通ることを確かめる。計画の終端を 1 つにするための段（ccnavi は終端に全部の先行を求める）
