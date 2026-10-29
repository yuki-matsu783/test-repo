---
version: 1
ticket: feature-90-readme-に注意書きを足す-h8a-検証用
issue: 90
mr: 91
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
  issue #90 は README に注意書きを 1 つ足す依頼で、ccnavi の検証用。
  設計判断も並行作業も要らないので quick-work で足りる。
allow:
  - match: Write|Edit
    glob: "README.md"
---
## 目的

issue #90 の依頼どおり、README.md に注意書きを 1 つ足す。

## 範囲

- `README.md` の冒頭（タイトルの直後）に、注意書きを 1 段落足す。
- 文面は「この README は ccnavi の検証用の演習文書で、仕様としての正本ではない」という趣旨の 1〜2 文とする。

## 対象外

- 既存の本文（使い方・仕様・完成の確かめ方）の書き換え。
- 末尾にある「テスト」の 2 行と HTML コメント `<!-- 78 検証用の下書き -->` の削除・変更。
- `main.sh`・`index.html` など README 以外のファイル。

## 完了の確かめ方

- `README.md` の冒頭に注意書きがあり、タイトル・既存の本文の順序と内容が変わっていない（`git diff` で追加行だけが出ている）。
- 変更が `README.md` だけに収まっている。

## 計画の理由

範囲が 1 ファイルの追記に限られ、途中で判断を挟む必要がないため、直線の quick-work 1 フェーズにした。
