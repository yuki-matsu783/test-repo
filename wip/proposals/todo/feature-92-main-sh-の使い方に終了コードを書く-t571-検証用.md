---
version: 1
ticket: feature-92-main-sh-の使い方に終了コードを書く-t571-検証用
issue: 92
mr: 93
title: "main.sh の使い方に終了コードを書く（T571 検証用）"
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
  使い方の表示に終了コードが無く、利用者が失敗の種類を区別できない。
  issue #92 の要求どおり、使い方の表示と README に終了コードを書く。
allow:
  - match: Write|Edit
    glob: "main.sh README.md"
---
## 目的

`main.sh` の使い方の表示と README の使い方に、終了コードの意味を書く。

## 範囲

- `main.sh`: 引数不足時の使い方の表示に終了コードを書く
- `README.md`: 使い方の節に終了コードの表を書く

## 対象外

- 終了コードの値そのものの変更（現状の 0 / 1 を保つ）
- 絞り込み・整形の処理の変更

## 完了の確かめ方

- 引数を足りなくして `sh main.sh` を実行すると、表示に終了コード 1 の意味が出る
- 正常系（`sh main.sh <入力> <パターン> <接頭辞>`）が従来どおり終了コード 0 で終わる
- 入力ファイル無しが従来どおり終了コード 1 で終わる

## 計画の理由

変更が `main.sh` と `README.md` の 2 ファイルに閉じ、設計判断も並行作業も要らないため quick-work にする。
