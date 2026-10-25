---
ticket: feature-183-arg-research3-01-01
parent: feature-183-arg-research3
learnings: 4
---

## 生の git は guard で止まる

生の git は使えない。`ccnavi-git.sh` を通す（`builtin:guard-raw-git` で止まった）。
- 処理: 反映 raw-git-blocked-use-ccnavi-git

## 実行時に決まるコマンド名は止まる

`$S` のように実行時に決まるコマンド名は `DENY_COMMAND_NAME_EXPANSION` で止まる。スクリプトはパスを直接書く。
- 処理: 反映 command-name-expansion-denied

## rm -rf は拒否される

`rm -rf` の再帰削除は拒否される。消すものを名指しで `rm -f` し、空になったら `rmdir` する。
- 処理: 反映 rm-rf-denied-use-named-rm

## add と commit はワークツリーの中で打つ

`ccnavi-git.sh add` と `commit` は、いまのディレクトリのワークツリーで実行する。親のディレクトリから打つと pathspec が一致しない。
- 処理: 反映 git-add-commit-in-worktree
