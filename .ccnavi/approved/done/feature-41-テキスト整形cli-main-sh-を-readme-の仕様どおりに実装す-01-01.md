---
version: 1
ticket: feature-41-テキスト整形cli-main-sh-を-readme-の仕様どおりに実装す-01-01
parent: feature-41-テキスト整形cli-main-sh-を-readme-の仕様どおりに実装す
phase: 1
title: "main.sh の main 関数を実装する"
rationale: |
  親の計画 quick-work の 1 枚目。README.md の仕様どおりに main.sh の TODO を完成させる。範囲は親の allow（main.sh）の中に収める。
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-24T20:08:27+0000"
base_sha: "8a4679756234bb4845ed50ee05c371be3faf2b0b"
completed_at: "2026-10-24T20:09:59+0000"
merged_sha: "0a562a127ee37361cf53c7b4a7bca8d1664a7f2c"
finished_to: "review"
settled_by: "confirm"
---
## 目的

README.md の仕様どおりに、`main.sh` の `main` 関数（TODO の箇所）を実装する。入力ファイルから絞り込みパターンを含む行だけを残し、行頭の空白を除いて番号を振り、`<出力の接頭辞>.txt` に書き出す。

## 範囲

`main.sh` だけ。`main` 関数の中身と、そのための補助関数に限る。

## 対象外

- `README.md` の変更
- `main.sh` 以外のファイル

## 完了の確かめ方

手元で `sh main.sh` を次の場合に実行して確かめる。

- 引数が足りないとき、使い方を表示して終了する（終了コードは 0 以外）
- 入力ファイルが無いとき、エラーで終了する（終了コードは 0 以外）
- 一致する行があるとき、その行だけを番号つきで `<接頭辞>.txt` に書き出す
- 一致する行が無いとき、空の `<接頭辞>.txt` を作って正常終了する（終了コードは 0）

## 計画の理由

親の計画の 1 枚目で、実装そのもの。範囲は親の allow に収める。
