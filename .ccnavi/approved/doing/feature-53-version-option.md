---
version: 1
ticket: feature-53-version-option
issue: 53
mr: 56
title: "main.sh に --version オプションを足す（ccnavi 検証 T3）"
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
  issue #53 は main.sh に --version を足し、「0.1.0」を表示することを求めている。
  変更は main.sh の一箇所だけで、設計判断も並行作業も要らないので quick-work にする。
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T04:28:28+0000"
base_sha: "889ad195f5080698aee1653655a73d9767e7f406"
---
## 目的

`sh main.sh --version` で版の番号 `0.1.0` を表示して正常終了できるようにする（issue #53）。

## 範囲

- `main.sh` の `main` 関数の先頭で、最初の引数が `--version` なら `0.1.0` を標準出力に出して `exit 0` する。
- 引数の個数の確認より前に判定する（`--version` は引数を 3 つ取らないため）。
- 版の番号は `main.sh` の中に一箇所だけ置く（変数にする）。

## 対象外

- `README.md` への `--version` の追記。issue #53 の範囲は main.sh だけなので、ここでは触らない。追記するかどうかはユーザが決める（承認の場で確認したい点）。
- `README.md` 末尾にある「テスト テスト」の行（既存の文書の問題で、今回の作業とは別）。
- 版の番号を別ファイルから読む仕組み、`--help` などの他のオプション。

## 完了の確かめ方

- `sh main.sh --version` が `0.1.0` を出し、終了コードが 0 になる。
- `sh main.sh` が従来どおり使い方を出して終了コード 1 になる（引数が足りないとき）。
- `sh main.sh <存在しないファイル> <語> <接頭辞>` が従来どおりエラーで終了コード 1 になる。
- `sh main.sh <入力> <語> <接頭辞>` が従来どおり `<接頭辞>.txt` を作る（回帰）。
- `sh -n main.sh` で構文エラーがない。

## 計画の理由

範囲が一つのファイルに閉じ、手順が直線（編集 → 確かめ）なので quick-work とする。
