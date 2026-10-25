---
version: 1
ticket: feature-129-main-sh-の使い方の説明を直す-c4-検証用
issue: 129
mr: 130
title: "main.sh の使い方の説明を直す（C4 検証用）"
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
  issue #129 は「main.sh の使い方の説明を直す」だけを求めている。対象は main.sh 1 ファイルで、
  設計判断も並行作業も要らないため quick-work で足りる。
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T10:19:11+0000"
base_sha: "50715690db13f43abf5cdaf130feb547b8bae01a"
---
## 目的

main.sh の冒頭コメントにある使い方の説明（引数の意味・終了コード・例）を、実際の動作と一致させる。

## 範囲

- main.sh の冒頭コメント（使い方・引数・終了コード・例）の文言だけを直す
- 実際の動作が説明と食い違う箇所があれば、説明の側を動作に合わせる

## 対象外

- main.sh の処理の振る舞い（引数の扱い、出力の形式、エラーの文言）を変えること
- main.sh 以外のファイル（README.md・index.html など）

## 完了の確かめ方

- main.sh の冒頭コメントの説明と、`sh main.sh` の実際の出力（引数不足・入力ファイル無し・正常系）が一致している
- 冒頭コメントの例（`sh main.sh access.log ERROR errors`）を実際に走らせ、説明どおり `errors.txt` ができることを確かめる
- 変更は main.sh の差分だけ（`git diff --stat` で main.sh 以外に変更が無い）

## 計画の理由

1 ファイルの文言修正で、設計・受入テストを分ける必要がない。子 1 つ（quick-work）で完結する。
