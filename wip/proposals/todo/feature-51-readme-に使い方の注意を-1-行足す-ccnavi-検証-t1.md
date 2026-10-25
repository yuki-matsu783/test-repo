---
version: 1
ticket: feature-51-readme-に使い方の注意を-1-行足す-ccnavi-検証-t1
issue: 51
mr: 54
title: "README に使い方の注意を 1 行足す（ccnavi 検証 T1）"
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
  issue #51 の依頼は README の「使い方」節に 1 行の注意を足すだけで、設計判断も並行作業も要らない。
allow:
  - match: Write|Edit
    glob: "README.md"
feedback: []
started_at:
base_sha:
---
## 目的

issue #51 の依頼どおり、README の「使い方」節の末尾に「引数は 3 つ必要です」という 1 行の注意を足す。
ccnavi のチケット作業の通し確認を兼ねる。

## 範囲

- `README.md` の「使い方」節。使い方の表（`| 引数 | 内容 |` の表）の直後、`## 仕様` の見出しの直前に、空行を挟んで 1 行の注意を足す。
- 文面は「引数は 3 つ必要です。」とする。

## 対象外

- `main.sh`、`index.html` などほかのファイル。
- README の既存の文章の書き直し。末尾にある「テスト」の行が 2 行あることも、この作業では直さない。
- 仕様・完成の確かめ方の節の変更。

## 完了の確かめ方

- `README.md` の差分が「使い方」節への 1 行の追加だけであること（`git diff` で確かめる）。
- 追加された行が「使い方」節の中にあり、`## 仕様` の前に来ること。
- ほかのファイルに変更が無いこと。

## 計画の理由

作業は 1 ファイルの 1 行追加で、前後の関係を持つ段階が無いので、`quick-work` の 1 段階だけにする。
