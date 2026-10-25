---
version: 1
ticket: feature-175-empty-filter-01-01
parent: feature-175-empty-filter
phase: 1
title: 調査（空の絞り込みパターンで落ちる条件と原因）
allow:
  - match: Write|Edit
    glob: "wip/research/*"
---
main.sh を空の絞り込みパターンで動かし、issue #175 の「全行を出さず落ちる」条件を再現する。

やること:

1. main.sh の絞り込み部分（awk と PAT の受け渡し）を読み、空パターンの経路を追う
2. 条件を変えて試す: 入力ファイルの形（空・末尾改行なし・長い行・非 ASCII）、パターンの形（空・空白のみ・バックスラッシュ）、シェル（sh の実体と bash での実行）、awk の種類
3. 再現した条件と、落ちる・全行が出ない原因を `wip/research/summary.md` にまとめる。再現しなければ、試した条件と結果を書く
4. 直す案があれば、案として書くだけにする（実装はフェーズ 2）

完了の条件: `wip/research/summary.md` に、再現手順（コマンドと出力）と原因の見立て、または「再現しなかった」の記録が残っていること。
