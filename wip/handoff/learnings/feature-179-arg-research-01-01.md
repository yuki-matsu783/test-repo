---
ticket: feature-179-arg-research-01-01
parent: feature-179-arg-research
learnings:
  - 生の git は PreToolUse のガードで止まる。`cd <worktree> && git ...` も対象になるので、読む系も書く系も ccnavi-git.sh の入口を使う。
  - ccnavi-git.sh の add のパスは、打った時点のカレントディレクトリ基準。別のディレクトリから相対パスで打つと pathspec エラーになるので、先に子のワークツリーへ cd してから打つ。
  - コマンド名を変数（`M=...; sh $M`）に入れると DENY_COMMAND_NAME_EXPANSION で止まる。パスは毎回直接書く。
  - wip/ 配下の md に frontmatter を付けないと、ccnavi --docs の索引に載らない（NOTICE_DOC_FRONTMATTER）。本文を書く前に type・title・description・tags・keywords を入れておくと、要件の「N 行」を崩さずに済む。
  - main.sh の使い方コメントは実際の挙動と一致していた（引数不足・入力なしは終了コード 1、正常は 0）。確認は作業の外（ワークスペース直下の scratchpad）で入力ファイルを作って行った。
---
