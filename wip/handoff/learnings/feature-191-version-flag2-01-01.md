---
ticket: feature-191-version-flag2-01-01
parent: feature-191-version-flag2
learnings: 1
---

- `ccnavi-ticket.sh learn` はワークツリーの中で打つ。ワークスペースルートから打つと拒否される。
- 確認コマンドでスクリプトのパスを変数に入れると（`sh "$W/main.sh"`）、ガード DENY_COMMAND_NAME_EXPANSION で止まる。パスを直接書けば通る。
