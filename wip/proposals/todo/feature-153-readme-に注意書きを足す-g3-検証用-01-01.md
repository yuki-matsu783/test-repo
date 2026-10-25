---
version: 1
ticket: feature-153-readme-に注意書きを足す-g3-検証用-01-01
parent: feature-153-readme-に注意書きを足す-g3-検証用
phase: 1
title: "README.md に検証用の注意書きを 1 段落足す"
allow:
  - match: Write|Edit
    glob: "README.md"
---
## 目的

親の目的（README.md を読んだ人が、検証用の演習で内容が変わりうると分かる）を、フェーズ 1 の 1 作業で満たす。

## 範囲

- README.md の `# 演習: テキスト整形CLI` の見出しの直下に、空行を挟んで注意書きを 1 段落足す
- 文言の案: 「> **注意**: この README は検証用の演習です。内容は予告なく変わることがあります。」

## 対象外

- README.md 以外のファイル
- 既存の本文・「テスト」の行・末尾の HTML コメントの変更
- 承認で文言が変わらない限り、文言の変更

## 完了の確かめ方

- README.md の 1 行目（見出し）の直下に、承認された文言の注意書きが 1 段落ある
- `sh .ccnavi/scripts/ccnavi-git.sh diff` で、変わったのが注意書きの行だけである
- 承認された文言と、README.md の注意書きの文字が一致する
