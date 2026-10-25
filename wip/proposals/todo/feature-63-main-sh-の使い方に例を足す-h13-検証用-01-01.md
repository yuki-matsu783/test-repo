---
version: 1
ticket: feature-63-main-sh-の使い方に例を足す-h13-検証用-01-01
parent: feature-63-main-sh-の使い方に例を足す-h13-検証用
phase: 1
title: "main.sh の使い方に実行例を 1 行足す"
rationale: |
  親の計画は quick-work（フェーズ 1）の 1 ステップだけで、変更は main.sh の 1 箇所に収まる。子は親の範囲をそのまま使うので、allow も親と同じ main.sh の 1 つに絞る。
allow:
  - match: Write|Edit
    glob: "main.sh"
---

## 目的

使い方の表示に、そのまま打てる実行例を 1 行足す。親の目的と同じ。

## 範囲

- `main.sh` の `main` 関数内、使い方を表示する `echo` の行と `exit 1` の間に、例を表示する `echo` を 1 行足す。
  - 追加する行: `echo "例: sh main.sh input.txt ERROR error-log" >&2`
  - 標準エラー（`>&2`）に出す。既存の使い方の行と同じ。

## 対象外

- 処理の中身（絞り込み・整形・出力）は変えない。
- 使い方の既存の文言、エラーメッセージ、終了コードは変えない。
- `README.md` は変えない。
- この子では実装しない。承認のあとに、子のワークツリーで実装する。

## 完了の確かめ方

- `sh main.sh` を引数なしで実行し、使い方の行に続けて例の行が標準エラーに出て、終了コードが 1 であること。
- `input.txt` を用意して `sh main.sh input.txt ERROR error-log` を実行し、`error-log.txt` が従来どおり作られること。
- `sh -n main.sh` が通ること。

## 計画の理由

親の計画は `quick-work` の 1 ステップだけで、子もその 1 つ（フェーズ 1 の 1 枚目）。範囲が `main.sh` の数行に限られるため、子は 1 つで足りる。
