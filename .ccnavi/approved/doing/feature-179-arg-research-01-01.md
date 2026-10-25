---
version: 1
ticket: feature-179-arg-research-01-01
parent: feature-179-arg-research
phase: 1
title: main.sh の引数と終了コードの調査
allow:
  - match: Write|Edit
    glob: "wip/research/*"
started_at: "2026-10-25T18:02:26+0000"
base_sha: "43d1488b8ec41297d864530c59c2e6ab8685bed3"
---
main.sh の引数の受け方と終了コードを読み、実際に実行して挙動を記録する。結果は wip/research/summary.md にまとめる。

手順:

1. main.sh を読み、先頭コメントの「引数」「終了コード」「例」の約束を書き出す
2. 一時ディレクトリ（scratchpad）に入力ファイルを作り、次の場合をそれぞれ `sh main.sh ...` で実行する。終了コード・標準エラーの文言・出力ファイルの中身を記録する
   - 引数が 2 つ以下
   - 入力ファイルが存在しない
   - 絞り込みパターンが空文字
   - 絞り込みパターンに `\` や正規表現の記号を含む
   - 正常系（ERROR を含む行を絞る例）
3. wip/research/summary.md に、ケースごとの入力・終了コード・出力の要点を書く。コメントとの食い違いがあれば、その行を明記する
4. main.sh と wip/research/ 以外のファイルは変えない。コードは直さない
