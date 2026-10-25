---
title: add と commit は対象のワークツリーの中で打つ
type: pattern
description: ccnavi-git.sh の add と commit は、いまのディレクトリのワークツリーで実行する。親のディレクトリから打つと pathspec が一致しない
tags: [ccnavi, git, worktree]
keywords: [ccnavi-git.sh, add, commit, pathspec, ワークツリー]
sources: [feature-183-arg-research3-01-01]
---

`ccnavi-git.sh` の `add` と `commit` は、いまのディレクトリが属するワークツリーで実行される。親のディレクトリ（メインのチェックアウト）から打つと、pathspec が子のワークツリーのファイルと一致せず、対象が取れない。

- 子のワークツリーで作業するときは、そのワークツリーのディレクトリへ移ってから `add` と `commit` を打つ（`cd <パス> && sh <スクリプト> add ...` の形）。
- Bash の `cd` は呼び出しをまたいで続かないので、毎回絶対パスか `cd <パス> &&` で書く。
