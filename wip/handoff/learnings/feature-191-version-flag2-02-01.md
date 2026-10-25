---
ticket: feature-191-version-flag2-02-01
parent: feature-191-version-flag2
learnings: 2
---

## 子の reference は --docs の検索範囲に入らない

子のワークツリーに置いた新しい reference は、`ccnavi-launcher.sh --docs` の検索範囲（ワークスペースのルート。`.claude/worktrees/` は .gitignore で外れる）に入らない。「引けること」の確かめは、親が取り込んだあと、メインのツリーで同じコマンドを打って行う。子の中で 0 件になっても、keywords のせいにしない。
- 処理: 対象外 検索範囲と確かめの手順の注意で、子の作業の中で直す手順ではない。親の取り込み後の確かめで足りる

## 子のワークツリーでは生の ls・git が止まる

子のワークツリーでは、生の `ls`・`git` の直接実行がガードで止まる。読みも操作も `ccnavi-git.sh` を通す。
- 処理: 対象外 ガードの案内文が既に `ccnavi-git.sh` の入口を示している
