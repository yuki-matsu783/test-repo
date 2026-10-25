---
version: 1
ticket: feature-76-readme-に注意書きを足す-h8a-検証用
issue: 76
mr: 77
title: "README に注意書きを足す（H8a 検証用）"
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
  issue #76 は README に注意書きを足す依頼。対象は README.md 1 ファイルだけで、設計判断も並行作業も要らないので quick-work にする。
allow:
  - match: Write|Edit
    glob: "README.md"
---
## 目的

issue #76 の依頼どおり、README.md の冒頭に注意書きを 1 つ足す。この README は ccnavi の検証（H8a）用に使われるもので、演習の本文は変えない。

## 範囲

- README.md の冒頭（タイトルの直下）に「注意書き」の節を 1 つ足す。
- 注意書きの内容は次の 2 点だけ。
  - この文書は ccnavi の検証用であること。
  - 演習の仕様（使い方・仕様・完成の確認）は従来どおりであること。

## 対象外

- 演習の使い方・仕様・完成の確認の本文は変えない。
- 末尾にある「テスト」の行 2 つは、そのまま残す（消すかどうかは別途ユーザに確かめる）。
- `main.sh` と `index.html` には触れない。

## 完了の確かめ方

- `README.md` を開くと、タイトル直下に注意書きの節がある。
- 注意書きの追加以外に差分が無い（`git diff` の対象が README.md の 1 ファイルだけ）。
- 演習の「使い方」「仕様」「完成の確認」の見出しと本文が、変更前と同じである。

## 計画の理由

変更は 1 ファイルの小さな文面追加で、前の工程が次の工程に先行する一直線の作業。並行させる理由が無いので quick-work 1 本にする。
