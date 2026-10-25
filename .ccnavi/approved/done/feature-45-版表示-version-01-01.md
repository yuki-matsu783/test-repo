---
version: 1
ticket: feature-45-版表示-version-01-01
parent: feature-45-版表示-version
phase: 1
title: "版表示 --version（実装）"
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T00:52:59+0000"
base_sha: "b039c4e747408cd4cd5f664487d56dd60a077006"
completed_at: "2026-10-25T00:53:36+0000"
merged_sha: "28f4e14537a1dccd68920d9871b80181a5ef07e5"
finished_to: "review"
settled_by: "confirm"
---
## 目的

親 `feature-45-版表示-version` の quick-work の 1 ステップとして、`main.sh` に `--version` を実装する。

## 範囲

- `main.sh` のみ。第 1 引数が `--version` のとき `0.1.0` を標準出力に出して終了コード 0 で終わる処理を、引数の検査より前に置く
- 版の値は `main.sh` の中の 1 か所に置く

## 対象外

- `main.sh` 以外のファイル
- 既存の絞り込みの処理、引数不足時の使い方の表示

## 完了の確かめ方

- `sh main.sh --version` が `0.1.0` を 1 行出し、終了コードが 0
- `sh main.sh` が従来どおり使い方を出し、終了コードが 1
- 3 引数の呼び出しで `<接頭辞>.txt` の中身が従来と同じ
