---
ticket: feature-183-arg-research3-01-01
parent: feature-183-arg-research3
learnings: 4
---

- 生の git は使えない。`ccnavi-git.sh` を通す（`builtin:guard-raw-git` で止まった）。
- `$S` のように実行時に決まるコマンド名は `DENY_COMMAND_NAME_EXPANSION` で止まる。スクリプトはパスを直接書く。
- `rm -rf` の再帰削除は拒否される。消すものを名指しで `rm -f` し、空になったら `rmdir` する。
- `ccnavi-git.sh add` と `commit` は、いまのディレクトリのワークツリーで実行する。親のディレクトリから打つと pathspec が一致しない。
