---
ticket: feature-191-version-flag2-01-01
parent: feature-191-version-flag2
learnings: 2
---

## learn はワークツリーの中で打つ

`ccnavi-ticket.sh learn` はワークツリーの中で打つ。ワークスペースルートから打つと拒否される。
- 処理: 対象外 ccnavi の CLI の使い方。拒否の文言が場所を案内するため、手順に足す材料ではない

## 確認コマンドの変数展開は止まる

確認コマンドでスクリプトのパスを変数に入れると（`sh "$W/main.sh"`）、ガード DENY_COMMAND_NAME_EXPANSION で止まる。パスを直接書けば通る。
- 処理: 対象外 ガードが止める理由を文言で出し、パスを直接書けば通ることも既に案内される
