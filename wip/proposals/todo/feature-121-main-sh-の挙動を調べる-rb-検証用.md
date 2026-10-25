---
version: 1
ticket: feature-121-main-sh-の挙動を調べる-rb-検証用
issue: 121
mr: 122
title: "main.sh の挙動を調べる（RB 検証用）"
phases:
  research:
    kind: work
    title: 調査
    review: none
    scope:
    - wip/research/*
    deliverables:
    - wip/research/summary.md
    when: 既存の振る舞いや依存が分からないとき。分かっているなら省略する
plan:
  - research
rationale: |
  main.sh の振る舞い（引数の扱い、終了コード、絞り込みと出力の仕方、境界の入力）を、
  コードを変えずに読んで確かめる。実装の前に挙動を文書に残すための調査。
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
## 目的

リポジトリ直下の `main.sh` が、どんな入力でどう振る舞うかを調べ、結果を `wip/research/summary.md` にまとめる。ccnavi の検証用の調査で、`main.sh` そのものは直さない。

## 範囲

- 読むもの: `main.sh`、`README.md`
- 書くもの: `wip/research/` の下だけ（調べるための入力ファイルや出力もここに置く）
- 調べる内容: 引数の数の判定、入力ファイルが無いときの扱い、絞り込みパターンの扱い（空文字、正規表現の記号、`\` を含む文字列）、出力ファイル名の決まり、一致する行が無いときの出力、終了コードの違い

## 対象外

- `main.sh` と `README.md` の変更（読むだけ）
- `wip/research/` の外への書き込み（`scratchpad/` や、出力を別の場所に作ることも含む）
- 挙動を直す提案や実装。見つけた問題は summary に書くだけで、直すかどうかは別のチケットでユーザが決める

## 完了の確かめ方

- `wip/research/summary.md` があり、上の「調べる内容」の各項目について、観察した結果（実行したコマンドと出力、または読んだ行）が書かれている
- 観察した結果を再現するための入力ファイルと実行の手順が `wip/research/` の中に残っている
- 変更したファイルが `wip/research/` の中だけであることを、`ccnavi-git.sh status` で確かめる

## 計画の理由

調査は 1 フェーズで足りる。結果を読んでユーザが次の作業を決めるので、レビューは要らず（`review: none`）、フェーズの成果物は summary だけにする。
