---
version: 1
ticket: feature-113-main-sh-の使い方の説明を直す-v1-検証用
issue: 113
mr: 114
title: "main.sh の使い方の説明を直す（V1 検証用）"
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
  issue #113 は main.sh の使い方の説明を直すことを求めている。現状の main.sh は、引数なしで打つと
  「使い方: sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>」の 1 行しか出ず、各引数の意味や
  絞り込みパターンが空のときの扱いが書かれていない。作業は main.sh 1 ファイルの説明文に閉じ、挙動は変えない。
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T09:38:24+0000"
base_sha: "1cb29c023eeeb7f35dc34fbc4afc63fb4303e003"
---
## 目的

main.sh を打つ人が、引数なしで使い方を見たときに、3 つの引数の意味と、絞り込みパターンが空のときの扱いが分かるようにする。

## 範囲

- main.sh の使い方の表示（引数が足りないときに標準エラーへ出す文）を、3 つの引数の意味が分かる形に直す
- main.sh 先頭コメントの使い方の説明と、使い方の表示の内容を揃える

## 対象外

- 絞り込み・整形の動作、出力ファイル名、終了コードの値（挙動は変えない）
- main.sh 以外のファイル（README.md の古い記述は別の作業として報告する）

## 完了の確かめ方

- `sh -n main.sh` が構文エラーなしで終わる
- `sh main.sh` を引数なしで打つと、3 つの引数の意味が標準エラーに出て、終了コードが 1 になる
- `sh main.sh access.log ERROR errors` を打つと、従来どおり `errors.txt` ができる（挙動が変わっていないこと）

## 計画の理由

main.sh 1 ファイルの説明文だけを直す作業で、段階を分ける理由がない。quick-work の 1 段で足りる。
