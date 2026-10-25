---
version: 1
ticket: feature-61-h1x-readme-example
issue: 61
mr: 62
title: "README の使い方の表に例を 1 行足す（H1x 検証用 3）"
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
  issue #61 は README の使い方に例を 1 行足す依頼（ccnavi 検証用）。既存の MR !62（ブランチ feature-61-h1x-readme-example）は、README 末尾に空行と下書きのコメント行を足しただけで、依頼の内容にはなっていない。この MR を使い、依頼どおりの変更に置き換える。
allow:
  - match: Write|Edit
    glob: "README.md"
---
## 目的

issue #61 の依頼どおり、README の「使い方」に実行例を 1 行足し、利用者が入力の形をすぐ思い浮かべられるようにする。

## 範囲

- `README.md` の「## 使い方」の節に、実行例を 1 行足す。
  - 例: `sh main.sh input.txt ERROR out` のように、入力ファイル・絞り込みパターン・出力の接頭辞を埋めた例の行。
  - 置き場所は、既存の `sh main.sh <入力ファイル> <絞り込みパターン> <出力の接頭辞>` の行の直後。
- MR !62 に残っている下書き（末尾の空行と `<!-- 61 検証用の下書き -->`）は取り除く。

## 対象外

- `README.md` の他の節・既存の「テスト」の行には触らない。
- `main.sh` など、README 以外のファイルには触らない。
- 表（引数の一覧）の行は増やさない。例は表の外の 1 行とする。

## 完了の確かめ方

- `README.md` の「## 使い方」に、実行例の 1 行が入っている。
- `git diff main -- README.md` で、差分が実行例 1 行の追加と下書き行の削除だけになっている。
- MR !62 の差分が issue #61 の依頼と一致している。

## 計画の理由

作業は README 1 ファイルの小さな書き換えで、設計判断も並行作業も要らない。`quick-work` の 1 フェーズで足りる。
