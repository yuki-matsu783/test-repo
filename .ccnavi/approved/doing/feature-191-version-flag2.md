---
version: 1
ticket: feature-191-version-flag2
issue: 191
mr: 192
title: main.sh に --version オプションを足す (G2)
phases:
  quick-work:
    kind: work
    title: 小さい作業
    review: mr
    scope: inherit
    when: 設計判断や並行作業が要らないとき
  skill-improve:
    kind: feedback
    title: スキル改善
    review: mr
    scope:
    - .claude/skills/*
    - docs/wiki/*
    when: 振り返りでスキルの候補が出たとき。候補が無ければ置かない
plan:
- quick-work
rationale: 'main.sh に版番号を返す --version オプションが無く、利用者が今どの版の main.sh を使っているか確かめられない。

  issue #191 の G2 として、--version を足して版番号を表示し、終了コード 0 で終わるようにする。

  設計判断は要らず、触るのは main.sh と検証用のテストだけなので quick-work の 1 ステップで回す。

  '
allow:
- match: Write|Edit
  glob: main.sh
- match: Write|Edit
  glob: tests/*
- match: Write|Edit
  glob: docs/wiki/*
- match: Write|Edit
  glob: .claude/skills/*
started_at: 2026-10-25T22:13:34+0000
base_sha: fd45556075c68f250ace68989f1f0e5844c2cadd
feedback:
- skill-improve
---
## 目的

`sh main.sh --version` で版番号を 1 行表示し、終了コード 0 で終わる。通常の使い方（3 つの引数）の振る舞いは変えない。

## 範囲

- `main.sh`: 版番号の定数（例: `VERSION="0.1.0"`）を足し、引数の先頭が `--version` のときに表示して終わる処理を足す
- `tests/*`: `--version` の出力と終了コード、既存の使い方（引数不足・入力ファイル無し）が変わらないことを確かめるテストを足す
- `docs/wiki/*`、`.claude/skills/*`: 使い方の説明を変える必要が出たときだけ触る。今の子の提案では両方とも使わない（現状、この 2 か所に該当する文書・スキルは無い）

## 対象外

- 版番号の付け方（セマンティック・バージョニングの運用、タグ付け）。版番号は定数 1 つの値として入れるだけで、タグは作らない
- `README.md` の書き換え。README は範囲に入っていないので触らない
- `main.sh` の絞り込み・整形の処理そのもの

## 完了の確かめ方

- `sh main.sh --version` が版番号を 1 行出し、終了コード 0 で終わる
- 引数が 3 つ未満のときの使い方表示と終了コード 1、入力ファイルが無いときのエラーと終了コード 1 が従来どおり
- `tests/` のテストが通る（テストの実行方法はこの作業で `tests/` に書く）

## 計画の理由

設計判断や並行作業が要らず、範囲も親の提案の範囲に収まる小さい作業なので、quick-work の 1 ステップにする。
