---
version: 1
ticket: feature-189-version-flag
issue: 189
mr: 190
title: "main.sh に --version オプションを足す (G'1)"
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
  main.sh の利用者が、いまの版を引けるようにする。ccnavi の検証用の小さな変更で、
  設計判断も並行作業も要らないため quick-work の 1 ステップで回す。
allow:
  - match: Write|Edit
    glob: "main.sh"
  - match: Write|Edit
    glob: "tests/*"
  - match: Write|Edit
    glob: "docs/wiki/*"
  - match: Write|Edit
    glob: ".claude/skills/*"
---
## 目的

`sh main.sh --version` で版の文字列を表示して終了できるようにする。引数の 3 つを取る本来の使い方は変えない。

## 範囲

- `main.sh` に `--version` を処理する分岐を足し、版の文字列を 1 か所で持つ
- `tests/*` に、`--version` の出力と終了コード、既存の使い方（引数不足・入力ファイル無し）が変わらないことを確かめるテストを足す
- `docs/wiki/*` と `.claude/skills/*` のうち、`main.sh` の使い方に触れている文書があれば、`--version` を 1 行足す（無ければ触らない）

## 対象外

- 版の番号づけの決まり（セマンティックバージョンの運用など）を決めること
- 絞り込み・整形の処理そのものを変えること
- 他のコマンドラインオプション（`--help` など）を足すこと

## 完了の確かめ方

- `sh main.sh --version` が版の文字列を 1 行出し、終了コード 0 で終わる
- `sh main.sh` や入力ファイル無しの既存の終了コード（1）と表示が変わらない
- 追加したテストが通る（テストの回し方は `tests/` の既存の形に合わせる）

## 計画の理由

設計判断も並行作業も要らない小さな変更なので、親 1 子 1 で回す quick-work の 1 ステップにする。
