---
ticket: feature-181-arg-research2-01-01
parent: feature-181-arg-research2
learnings: 3
---

## 1. git の打ち方

- git は生で打つと guard で止まる（`builtin:guard-raw-git`）。子のワークツリーでも `sh .ccnavi/scripts/ccnavi-git.sh <サブコマンド>` の形で打つ。`cd <ワークツリー> && git ...` の複合も同じく止まる。
- 処理: 対象外 既存の guard（builtin:guard-raw-git）と .ccnavi/docs/direct-flow.md・worktree.md の ccnavi-git.sh の決まりに書いてあり、手順の欠落ではない。記録だけで足りる

## 2. main.sh の確かめ方

- main.sh の引数と終了コードは、コメントの記述どおりだった。実行して確かめる調査では、作業ツリーに出力ファイルを残さないよう scratchpad のコピーで試すとよい。
- 処理: 対象外 .ccnavi/docs/scratchpad.md に、一時の出力とコマンド出力は scratchpad/ に置く決まりが既にある。確かめ方を新しい手順にする必要は無い。記録だけで足りる

## 3. 新しい md の frontmatter

- 調査メモのような新しい md には frontmatter（type 必須）を先に付ける。後から付けると、NOTICE_DOC_FRONTMATTER の案内を一度受けることになる。
- 処理: 対象外 .ccnavi/docs/frontmatter.md に type 必須と書いてある。NOTICE_DOC_FRONTMATTER は後付けの案内で、規則の欠落ではない。記録だけで足りる
