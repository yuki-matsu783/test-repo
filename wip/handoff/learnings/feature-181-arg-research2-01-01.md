---
ticket: feature-181-arg-research2-01-01
parent: feature-181-arg-research2
learnings: 3
---

## 1. git の打ち方

- git は生で打つと guard で止まる（`builtin:guard-raw-git`）。子のワークツリーでも `sh .ccnavi/scripts/ccnavi-git.sh <サブコマンド>` の形で打つ。`cd <ワークツリー> && git ...` の複合も同じく止まる。

## 2. main.sh の確かめ方

- main.sh の引数と終了コードは、コメントの記述どおりだった。実行して確かめる調査では、作業ツリーに出力ファイルを残さないよう scratchpad のコピーで試すとよい。

## 3. 新しい md の frontmatter

- 調査メモのような新しい md には frontmatter（type 必須）を先に付ける。後から付けると、NOTICE_DOC_FRONTMATTER の案内を一度受けることになる。
