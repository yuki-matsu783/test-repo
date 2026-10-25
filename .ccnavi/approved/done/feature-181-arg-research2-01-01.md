---
version: 1
ticket: feature-181-arg-research2-01-01
parent: feature-181-arg-research2
phase: 1
title: main.sh の引数と終了コードの調査（調査）
human_review:
  required: false
  reason: 調査のみで、フェーズのレビュー型は none。結果の確認は親の提案の承認で済ませる
allow:
  - match: Write|Edit
    glob: "wip/research/*"
started_at: "2026-10-25T18:23:53+0000"
base_sha: "67ef107cd4c390d2d9493199aab479cc33bb3ce5"
completed_at: "2026-10-25T18:25:10+0000"
merged_sha: "9e788a95610dc60dc8e3f1a77fc6d964868e36b7"
finished_to: "done"
---
`main.sh`（ワークスペースのルート）の引数の扱いと終了コードを、実行して確かめる。

1. `main.sh` のヘッダのコメント（使い方・引数・終了コード・例）を読む
2. 引数の数（0・1・2・3 個）、入力ファイルの有無、絞り込みパターン（空・`\` を含む）を変えて実行する。実行は隔離した場所（`/home/user/test-repo/scratchpad/` 配下）で行い、出力ファイルはリポジトリに残さない
3. 各ケースの終了コード・標準エラー・出力ファイルの中身を記録する
4. `wip/research/summary.md` に、ケースごとに「コメントの記述」「実際の結果」「一致するか」を表で書く。食い違いがあれば `main.sh` の行番号を添える

変更してよいのは `wip/research/summary.md` だけ。`main.sh` 本体・テスト・他のファイルには触れない。
