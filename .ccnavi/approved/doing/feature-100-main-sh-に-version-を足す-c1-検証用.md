---
version: 1
ticket: feature-100-main-sh-に-version-を足す-c1-検証用
issue: 100
mr: 101
title: "main.sh に --version を足す（C1 検証用）"
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
  issue #100 の依頼。main.sh が版の文字列を出せるようにする。変更は main.sh の 1 ファイルで、
  設計判断もフェーズを分ける理由も無いので、小さい作業の 1 ステップで進める。
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T08:02:59+0000"
base_sha: "d50b799275eb2aedf391233c7fd49a015bb367c5"
---
## 目的

main.sh に `--version` の引数を足す。`sh main.sh --version` が版の文字列を 1 行出して終了コード 0 で終わるようにする。

## 範囲

main.sh のみ。`main()` の引数の検査より前に、第 1 引数が `--version` のときだけ版を出す分岐を足す。版の文字列は main.sh の中の定数で持つ（初版は `0.1.0`）。

## 対象外

- main.sh 以外のファイル（tests/、README、ドキュメント、設定）。範囲が main.sh だけのため、テストのファイルは足さない
- 既存の引数の仕様（3 引数の処理、終了コード 1 の条件、エラーメッセージ）を変えること
- 版の番号を付ける仕組み（タグや CI からの埋め込み）

## 完了の確かめ方

- `sh main.sh --version` が版の文字列を 1 行出し、終了コード 0 で終わる
- `sh main.sh` と引数が 3 つ未満の呼び出しは、従来どおり「使い方」を出して終了コード 1 で終わる
- 従来の呼び出し（例: `sh main.sh access.log ERROR errors`）の出力ファイルが変わらない。確かめに作るファイルはワークツリーに残さない

## 計画の理由

変更は main.sh の 1 ファイルで、フェーズを分ける理由が無い。`quick-work` の 1 ステップで、範囲は親の `allow`（main.sh）をそのまま上限にする。
