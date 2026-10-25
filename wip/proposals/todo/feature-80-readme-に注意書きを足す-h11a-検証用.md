---
version: 1
ticket: feature-80-readme-に注意書きを足す-h11a-検証用
issue: 80
mr: 81
title: "README に注意書きを足す（H11a 検証用）"
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
  issue #80 は README に注意書きを足すことを求めている（ccnavi 検証用）。設計判断も並行作業も要らない小さな文書の変更なので quick-work にする。
allow:
  - match: Write|Edit
    glob: "README.md"
---
## 目的

README を読む人に、この文書が演習用であり、`main.sh` の TODO がまだ未完成であることを先に伝える。

## 範囲

`README.md` に注意書きの節を 1 つ足す。置く場所は冒頭の説明の直後。文言は「この README は演習用です。`main.sh` の TODO の箇所はまだ未完成なので、完成させてから使ってください。」を提案とし、承認時に変える。

## 対象外

`main.sh` の中身、既存の仕様・完成の確認の節、末尾の「テスト」の行と `<!-- 78 検証用の下書き -->` のコメントには触れない。

## 完了の確かめ方

`README.md` に注意書きが 1 節で入っていること、既存の節の文言が変わっていないこと（`git diff` で追加行だけが出ること）を確かめる。

## 計画の理由

変更は 1 ファイルの追記だけなので、ステップを分ける利点がない。quick-work 1 段で足りる。
