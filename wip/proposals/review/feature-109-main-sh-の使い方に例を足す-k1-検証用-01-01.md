---
version: 1
ticket: feature-109-main-sh-の使い方に例を足す-k1-検証用-01-01
parent: feature-109-main-sh-の使い方に例を足す-k1-検証用
phase: 1
title: "main.sh の冒頭コメントに使い方の例を足す（quick-work）"
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T08:46:53+0000"
base_sha: "08df6670e765954ce4d7edc3d7e7f57432f710a0"
completed_at: "2026-10-25T08:48:50+0000"
merged_sha: "0a373ff85f3fdfc327f9d62f380b089c2adf0702"
finished_to: "review"
---
## 目的

main.sh の冒頭コメントの「例:」に、空の絞り込みパターンの例と、出力の接頭辞を変えた例を足す。

## 範囲

- main.sh の冒頭コメントだけを編集する
- 足す例は 2 つ
  - `sh main.sh access.log "" all`（絞り込みパターンが空文字なら全行を残し、`all.txt` に書く）
  - 既存の例と違う接頭辞を使った例（出力が `<接頭辞>.txt` になることが分かるもの）

## 対象外

- main.sh の処理（引数の検査、awk の部分、終了コード）は変えない
- main.sh 以外のファイルは触らない

## 完了の確かめ方

- `sh main.sh access.log "" all` を一時的な入力ファイルで実行し、出力に全行が番号付きで出ることを確かめる（確かめに使ったファイルは消す）
- `git diff` で、変わった行が冒頭コメントの範囲だけであることを確かめる
