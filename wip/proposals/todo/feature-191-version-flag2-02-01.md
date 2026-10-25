---
version: 1
ticket: feature-191-version-flag2-02-01
parent: feature-191-version-flag2
phase: 2
predecessors: [feature-191-version-flag2-01-01]
title: 実装の完了報告に実出力を貼る決まりを process-implement に足す
human_review:
  required: true
  reason: 工程スキルの reference を新しく足すため。以後の実装の作業の報告の仕方が変わる
allow:
  - match: Write|Edit
    glob: ".claude/skills/process-implement/*"
---
振り返りで拾った候補 1（`wip/handoff/skill-candidates.md` の「候補 1」）を反映する。

- 作るもの: `.claude/skills/process-implement/references/project/` に reference を 1 本足す（ファイル名は `completion-report-evidence.md`）。内容は候補の下書きのとおり。`SKILL.md` は直さない
- 下書きの中身を直すときは、`process-implement/SKILL.md` と既存の `references/` を読み直してから書く。同じ規則がすでにあれば足さない
- 動機になった wiki のパターン: なし。`docs/wiki/` はこのリポジトリに無いため、採否の記録（`docs/wiki/impact/`）は作らない
- 確かめ方: 追加した reference が `ccnavi --docs --keyword 実出力` で引けること。`ccnavi --lint` が通ること
- MR で見てもらい、承認を受けてから取り込む
