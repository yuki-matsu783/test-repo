---
version: 1
ticket: feature-183-arg-research3-01-01
parent: feature-183-arg-research3
phase: 1
title: main.sh の引数と終了コードの調査（フェーズ 1）
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
main.sh を実際に動かし、引数・入力ファイル・終了コードの振る舞いを確かめて、
wip/research/summary.md にまとめる。

手順:

1. main.sh と冒頭コメントを読み、仕様（引数 3 つ、終了コード 0 と 1、エラーの文言）を書き出す
2. 次の系統を、リポジトリの外（scratchpad か一時ディレクトリ）で実行する。入力は小さなファイルを自分で作る
   - 引数が 0 個・2 個のとき（終了コード 1、使い方の文言）
   - 入力ファイルが無いとき（終了コード 1、エラーの文言）
   - 正常系（絞り込みパターンに一致する行だけが番号付きで <接頭辞>.txt に出る）
   - 絞り込みパターンが空のとき（全行が出る）
   - パターンに \ や正規表現の記号を含むとき（ENVIRON で渡しているので文字どおりに一致するか）
   - 出力の接頭辞に拡張子を付けたとき（.txt が二重に付くか）
3. 実行結果（コマンド・終了コード・標準出力と標準エラーの要点）と、仕様との食い違いを
   wip/research/summary.md に書く。食い違いは事実として書き、直す提案はしない
4. summary.md のコマンドを打ち直して、終了コードが一致することを確かめる

wip/research/ の外に残るファイルを作らない。main.sh・README.md・index.html は変えない。
