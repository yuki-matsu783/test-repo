---
version: 1
ticket: feature-51-readme-に使い方の注意を-1-行足す-ccnavi-検証-t1-01-01
parent: feature-51-readme-に使い方の注意を-1-行足す-ccnavi-検証-t1
phase: 1
title: "README の使い方に注意を 1 行足す（ccnavi 検証 T1 の子）"
allow:
  - match: Write|Edit
    glob: "README.md"
rationale: |
  親 feature-51 の計画「小さい作業」（quick-work）の 1 段階。README.md の「使い方」節に 1 行足すだけ。
started_at: "2026-10-25T03:10:34+0000"
base_sha: "a78e47c2fc93ea423f2eb6e14333d079ddc0e29e"
completed_at: "2026-10-25T03:11:06+0000"
merged_sha: "1ed1c9c4dc54a9f6764267170391d1acf70d454b"
finished_to: "review"
---
## 目的

親 feature-51 の範囲どおり、README の「使い方」節の末尾に「引数は 3 つ必要です」という 1 行の注意を足す。

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

親の計画は `quick-work` の 1 段階だけなので、子も 1 本にする。作業は 1 ファイルの 1 行追加。
