---
version: 1
ticket: feature-139-main-sh-の使い方の説明を直す-c7-検証用-01-01
parent: feature-139-main-sh-の使い方の説明を直す-c7-検証用
phase: 1
title: "main.sh の冒頭コメントと使い方の表示を実際の動作に合わせる"
allow:
  - match: Write|Edit
    glob: "main.sh"
started_at: "2026-10-25T10:39:33+0000"
base_sha: "d75e606dc2539db60cfe9cf4fecb3b6670918fb5"
completed_at: "2026-10-25T10:41:41+0000"
merged_sha: "c714923781efcaa31ad69f26119df0b827f286fb"
finished_to: "review"
---
## 目的

main.sh の冒頭コメントと使い方の表示を、実際の動作どおりに直す。出力ファイルの上書きと、絞り込みが正規表現ではないことを書き足す。

## 範囲

- `main.sh` の冒頭コメント（使い方・引数・終了コード・例）
- `main.sh` の `main` 関数内の、引数が足りないときの使い方の表示（標準エラーへ出す行）

## 対象外

- `main.sh` の処理の行（awk の処理、終了コード、エラーの文言）
- `main.sh` 以外のファイル

## 完了の確かめ方

親の提案の「完了の確かめ方」の 1 から 4 を行い、結果を子の報告に書く。

## 計画の理由

親の計画は quick-work の 1 ステップで、子は 1 本だけ。
