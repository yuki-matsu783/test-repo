---
version: 1
ticket: feature-129-main-sh-の使い方の説明を直す-c4-検証用-01-01
parent: feature-129-main-sh-の使い方の説明を直す-c4-検証用
phase: 1
title: "main.sh の冒頭の使い方の説明を実際の動作に合わせる"
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T10:19:23+0000"
base_sha: "6ec61728fa256e5576431cf7ce520591f8b7e8b7"
completed_at: "2026-10-25T10:20:57+0000"
merged_sha: "33bd0444730d591c6ef5b2fe6651bb739b4be115"
finished_to: "review"
---
## 目的

main.sh の冒頭コメントの使い方の説明を、実際の動作と一致させる。

## 範囲

- main.sh の冒頭コメント（使い方・引数・終了コード・例）の文言だけを直す
- 説明と動作が食い違う箇所があれば、説明の側を動作に合わせる

## 対象外

- main.sh の処理の振る舞い（引数の扱い、出力の形式、エラーの文言）を変えること
- main.sh 以外のファイル

## 完了の確かめ方

- 冒頭コメントの例（`sh main.sh access.log ERROR errors`）を走らせ、説明どおり `errors.txt` ができる
- 引数不足（終了コード 1）と入力ファイル無し（終了コード 1、「エラー: 入力ファイルが見つかりません」）の出力が説明と一致する
- `git diff --stat` で main.sh 以外に変更が無い
