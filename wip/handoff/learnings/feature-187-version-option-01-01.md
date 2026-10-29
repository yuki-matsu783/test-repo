---
ticket: feature-187-version-option-01-01
parent: feature-187-version-option
learnings: recorded
---

- 生の `git` は、`cd <ワークツリー> && git ...` のように別のコマンドと繋いだ形でも Bash の保護（builtin:guard-raw-git）で止められた。git は最初から `sh .ccnavi/scripts/ccnavi-git.sh <サブコマンド>` で打つ。
- 子のワークツリーで作業するときは、コマンドの先頭で `cd` せず、ワークツリーの絶対パスを明示して実行する。セッションが再開されると作業ディレクトリが親のチェックアウトに戻ることがある。
- 報告の前に `sh -n` と対象コマンド（今回は `--version`）の実行出力を貼って確かめる。口頭の「確認済み」だけでは足りないとユーザに指示された。
