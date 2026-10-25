---
version: 1
ticket: feature-45-版表示-version
issue: 45
mr: 46
title: 版表示 --version
phases:
  quick-work:
    kind: work
    title: 小さい作業
    review: mr
    scope: inherit
    when: 設計判断や並行作業が要らないとき
plan:
- quick-work
rationale: 'main.sh に --version を足し、版 0.1.0 を表示できるようにする。設計判断も

  並行作業も要らない 1 ファイルの小さい変更なので、計画は quick-work の 1 ステップにする。

  '
allow:
- match: Write|Edit
  glob: main.sh
started_at: 2026-10-25T00:52:47+0000
base_sha: 2fb1c2fde289b4821cc21431081135c12f713659
feedback: []
completed_at: "2026-10-25T00:58:27+0000"
finished_to: "done"
---
## 目的

`sh main.sh --version` で版 `0.1.0` を標準出力に出せるようにする。

## 範囲

- `main.sh` に `--version` の処理を足す。第 1 引数が `--version` のときだけ `0.1.0` を出して正常終了する
- 版の値は `main.sh` の中に 1 か所だけ置く

## 対象外

- 既存の絞り込みの動作（3 引数で入力を絞り、`<接頭辞>.txt` に書く部分）は変えない
- 引数が無い・足りないときの使い方の表示は変えない
- README・ほかのファイル・版の付け方（タグなど）は変えない

## 完了の確かめ方

- `sh main.sh --version` が `0.1.0` を 1 行出し、終了コードが 0 になる
- `sh main.sh` を引数なしで打つと、従来どおり使い方を出して終了コード 1 になる
- 従来の 3 引数の呼び出しで、`<接頭辞>.txt` の中身が変わらない

## 計画の理由

範囲が `main.sh` の 1 ファイルに閉じ、振る舞いの変更も `--version` を足すだけなので、
設計・受入テストに分ける必要が無い。`quick-work` の 1 ステップで足りる。
