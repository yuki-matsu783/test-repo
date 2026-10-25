---
version: 1
ticket: feature-109-main-sh-の使い方に例を足す-k1-検証用
issue: 109
mr: 110
title: "main.sh の使い方に例を足す（K1 検証用）"
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
  main.sh の使い方の説明に例が 1 つしかなく、絞り込みパターンを空にしたときや、出力の接頭辞の使い方が分かりにくい。
  例を足すだけで振る舞いは変わらないので、設計判断や並行作業が要らない小さい作業として 1 フェーズにまとめる。
allow:
  - match: Write|Edit
    glob: "main.sh"
---
## 目的

main.sh の冒頭の使い方のコメントに、例を足す。読む人が引数の組み合わせを迷わず書けるようにする。

## 範囲

- main.sh の冒頭コメント（「例:」の節）に、次の例を足す
  - 絞り込みパターンを空文字にして全行を残す例
  - 出力の接頭辞に入れたものが `<接頭辞>.txt` になることが分かる例（既存の例と違う名前）
- 例の書き方は既存の例（`sh main.sh access.log ERROR errors`）に揃える

## 対象外

- main.sh の処理（awk の部分、引数の検査、終了コード）は変えない
- main.sh 以外のファイル（README.md、index.html、テストなど）は触らない

## 完了の確かめ方

- `sh main.sh access.log "" all` を実際に試し、`all.txt` に全行が番号付きで出ることを確かめる（確かめに使った一時ファイルは消す）
- main.sh の差分が冒頭コメントだけであることを `git diff` で確かめる
- 既存の例の書式（`sh main.sh ...` → 説明 → 出力）と揃っていることを読んで確かめる

## 計画の理由

振る舞いを変えず、main.sh の 1 ファイルの冒頭コメントを書き足すだけなので、設計も受入テストも分けずに、小さい作業の 1 フェーズ（quick-work）で済ませる。範囲は親の allow の main.sh に収まる。
