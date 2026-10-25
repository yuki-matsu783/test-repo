---
version: 1
ticket: feature-135-main-sh-の使い方の説明を直す-c6b-検証用
issue: 135
mr: 136
title: "main.sh の使い方の説明を直す（C6b 検証用）"
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
  main.sh 冒頭の使い方の説明（コメント）が、実際の動きと比べて足りていない。出力先の既存ファイルが上書きされること、行頭の空白が落ちること、絞り込みが正規表現ではなく部分一致であることが書かれていない。説明を実際の動きに合わせると、利用者が出力を読み違えない。
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T10:34:08+0000"
base_sha: "3e0868c9195a92e2358c372b18895c046b21e8e4"
---
## 目的

main.sh 冒頭の使い方の説明を、実際の動きに合わせて直す。説明に無い挙動（出力先の上書き、行頭の空白が落ちること、部分一致の絞り込み）を書き足す。

## 範囲

- main.sh 冒頭のコメント（使い方・引数・出力・例）だけ。
- 確かめた結果は、今の説明と食い違っていない（終了コード、使い方の文、例の出力）。

## 対象外

- main.sh の動き（awk の処理、引数の検査、終了コード）は変えない。
- main.sh 以外のファイル（README、他のスクリプト、phases.yml）は触らない。

## 完了の確かめ方

- 差分が main.sh のコメント行だけであること（`ccnavi-git.sh diff` で確かめる）。
- `sh -n main.sh` が通ること。
- 直す前と後で、引数なし・存在しない入力・例（`access.log ERROR errors`）の出力と終了コードが同じこと。

## 計画の理由

作業が小さく、設計判断や並行作業が要らないため quick-work の 1 ステップにする。範囲は親の allow（main.sh のみ）がそのまま上限になる。
