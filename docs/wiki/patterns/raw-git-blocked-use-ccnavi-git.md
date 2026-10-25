---
title: 生の git は ccnavi-git.sh を通す
type: pattern
description: ccnavi のワークツリーでは生の git が builtin:guard-raw-git で止まる。git は ccnavi-git.sh のサブコマンドとして打つ
tags: [ccnavi, git, guard]
keywords: [ccnavi-git.sh, guard-raw-git, 生の git, サブコマンド]
sources: [feature-183-arg-research3-01-01]
---

ccnavi の作業では生の `git` を打つと `builtin:guard-raw-git` で止まる。git の操作は `sh <リポジトリ>/.ccnavi/scripts/ccnavi-git.sh <サブコマンド> [引数...]` の形で打つ。

- 読み取り・変更・通信の別は、スクリプトの一覧（`ccnavi-git.sh` を引数なしで打つと出る）で確かめる。
- 通せない操作（force push、`-f`、`--no-verify` など）は回避せず、必要ならユーザに依頼する。
