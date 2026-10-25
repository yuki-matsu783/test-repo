---
title: main.sh の挙動の観察メモ
type: report
description: main.sh の引数・終了コード・絞り込み・出力の挙動を実行して観察した結果と手順
tags: [research, main-sh]
keywords: [main.sh, 終了コード, 引数, 絞り込み, 部分一致, index, 出力先, 観察, 調査]
---

# main.sh の挙動の観察メモ

実行: `wip/research/` の中で `sh ../../main.sh ...`（コードは変えていない）。入力は `input.log`（中身は下記）。

```
  INFO start
    ERROR disk full
WARN a\b
ERROR (x+y)
plain line
```

## 1. 引数が 3 つ未満

- `sh ../../main.sh` → 使い方を標準エラーに出し、終了コード 1
- `sh ../../main.sh input.log ERROR` → 同じく使い方を出し、終了コード 1

## 2. 入力ファイルが無い

- `sh ../../main.sh nofile.log ERROR out2` → `エラー: 入力ファイルが見つかりません: nofile.log`、終了コード 1
- `out2.txt` は作られない

## 3. 絞り込みパターンが空

- `sh ../../main.sh input.log "" out3` → 終了コード 0、全 5 行が残る（`out3.txt`）

## 4. パターンの記号と `\`

- `(x+y)` → `1. ERROR (x+y)` のみ（終了コード 0）。正規表現ではなく文字どおり一致
- `a\b` → `1. WARN a\b` のみ（終了コード 0）
- `ERR.*` → 0 行（終了コード 0）。`.*` は正規表現として働かない。`index` による部分一致

## 5. 空白の除き方と番号

- 行頭の空白・タブだけを `sub(/^[ \t]+/, "")` で除く。行末や途中の空白は残る
- 番号は残った行から 1 始まりで振る（`1. `、`2. ` ...）。`  INFO start` は `1. INFO start`

## 6. 出力ファイル名と一致なし

- 出力名は `<接頭辞>.txt`
- `sh ../../main.sh input.log ZZZ out6` → 終了コード 0、`out6.txt` は 0 バイトで残る

## 7. 出力先が書けない

- 出力先の親ディレクトリが無い（`nodir/x`）→ `cannot create nodir/x.txt: Directory nonexistent`、終了コード 2。main.sh 側の `exit` ではなく、シェルのリダイレクト失敗の終了コード
- 書き込み権限がないケースは未確認。この環境は root で動いており、読み取り専用ディレクトリを作っても書けてしまうため（`ro/out7.txt` は作られた）

## 気づいた点（直さない）

- 終了コードが 2 になる経路（7）は、README と main.sh の冒頭の「終了コード 0 / 1」の説明に含まれていない
- `set -eu` のため、出力のリダイレクトに失敗すると途中で止まる（2 が出る）
