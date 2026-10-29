---
version: 1
ticket: feature-100-main-sh-に-version-を足す-c1-検証用-01-01
parent: feature-100-main-sh-に-version-を足す-c1-検証用
phase: 1
title: "main.sh に --version を足す（子: 小さい作業）"
rationale: |
  親チケットの計画の 1 ステップ（quick-work）を実装する子。範囲は親の allow（main.sh）と同じ。
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T08:03:17+0000"
base_sha: "7ba215ec563f1b89b940e94ec294849e22bf1bac"
completed_at: "2026-10-25T08:05:39+0000"
merged_sha: "d26c50711f3410b7d7fc70a0b12c520b4865ea86"
finished_to: "review"
---
## 目的

親チケットの目的のとおり、main.sh に `--version` を足す。`sh main.sh --version` が版の文字列を 1 行出して終了コード 0 で終わるようにする。

## 範囲

main.sh のみ。`main()` の引数の検査より前に、第 1 引数が `--version` のときだけ版を出す分岐を足す。版の文字列は main.sh の中の定数で持つ（初版は `0.1.0`）。

## 対象外

親チケットの対象外と同じ。main.sh 以外のファイル、既存の引数の仕様、版の番号を付ける仕組みには触れない。

## 完了の確かめ方

- `sh main.sh --version` が版の文字列を 1 行出し、終了コード 0 で終わる
- `sh main.sh` と引数が 3 つ未満の呼び出しは、従来どおり「使い方」を出して終了コード 1 で終わる
- 従来の呼び出し（例: `sh main.sh access.log ERROR errors`）の出力ファイルが変わらない。確かめに作るファイルはワークツリーに残さない

作業が終わったら、main.sh の変更をコミットする（合流・push はしない）。
