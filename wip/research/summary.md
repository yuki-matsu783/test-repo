---
title: main.sh の引数と終了コードの調査
type: report
description: main.sh の引数の数と入力ファイルの有無ごとの終了コードと出力の結果
tags: [research, main-sh]
keywords: [main.sh, 引数, 終了コード, 使い方, 入力ファイル, 標準エラー]
---

引数が 2 個以下（0〜2 個）だと、使い方を標準エラーに出して終了コード 1 で終わる（例: `sh main.sh README.md テスト` → 1、標準出力は空）。
引数 3 個で入力ファイルが存在すれば終了コード 0 で、`<接頭辞>.txt` を作る（例: `sh main.sh README.md テスト zz` → 0、zz.txt を作る）。
入力ファイルが無いと「エラー: 入力ファイルが見つかりません: <パス>」を標準エラーに出して終了コード 1 で終わり、出力ファイルは作られない（例: `sh main.sh no_such_file.txt x y` → 1）。
