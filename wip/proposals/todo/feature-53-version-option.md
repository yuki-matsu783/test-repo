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
  README.md の使い方にも --version を書くことになったので、範囲に README.md を加える。
  変更は main.sh と README.md の二つだけで、設計判断も並行作業も要らないので quick-work にする。
allow:
  - match: Write|Edit
    glob: "main.sh"
  - match: Write|Edit
    glob: "README.md"
---
## 目的

`sh main.sh --version` で版の番号 `0.1.0` を表示して正常終了できるようにし、README.md の使い方にその書き方を載せる（issue #53）。

## 範囲

- `main.sh` の `main` 関数の先頭で、最初の引数が `--version` なら `0.1.0` を標準出力に出して `exit 0` する。
- 引数の個数の確認より前に判定する（`--version` は引数を 3 つ取らないため）。
- 版の番号は `main.sh` の中に一箇所だけ置く（変数にする）。
- `README.md` の「使い方」に `sh main.sh --version` を載せ、版の番号を表示して終了することを一行で書く。

## 対象外

- 版の番号を別ファイルから読む仕組み、`--help` などの他のオプション。
- `README.md` 末尾にある「テスト テスト」の行（既存の文書の問題で、今回の作業とは別。直さない）。
- `README.md` の「仕様」「完成の確認」の節（使い方の一行を足すだけで、書き換えない）。

## 完了の確かめ方

- `sh main.sh --version` が `0.1.0` を出し、終了コードが 0 になる。
- `sh main.sh` が従来どおり使い方を出して終了コード 1 になる（引数が足りないとき）。
- `sh main.sh <存在しないファイル> <語> <接頭辞>` が従来どおりエラーで終了コード 1 になる。
- `sh main.sh <入力> <語> <接頭辞>` が従来どおり `<接頭辞>.txt` を作る（回帰）。
- `sh -n main.sh` で構文エラーがない。
- `README.md` の使い方に `--version` の書き方があり、その書き方どおりに実行すると `0.1.0` が出る。

## 計画の理由

範囲が `main.sh` と `README.md` の二つのファイルに閉じ、手順が直線（編集 → 確かめ）なので quick-work とする。README.md の追記は、承認済みの範囲（main.sh だけ）から外れるため、ユーザの指示で範囲を広げる改版として出す。
