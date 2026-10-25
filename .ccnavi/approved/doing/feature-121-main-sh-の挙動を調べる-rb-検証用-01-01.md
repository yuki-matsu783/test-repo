---
version: 1
ticket: feature-121-main-sh-の挙動を調べる-rb-検証用-01-01
parent: feature-121-main-sh-の挙動を調べる-rb-検証用
phase: 1
phase_id: research
title: "main.sh の挙動を調べる（調査）"
allow:
  - match: Write|Edit
    glob: "wip/research/*"
started_at: "2026-10-25T09:59:07+0000"
base_sha: "5cb294658b432715baa6bae1539757b4130d9824"
---
## 目的

`main.sh` の振る舞いを、コードを変えずに読んで確かめ、`wip/research/summary.md` にまとめる。

## 範囲

- 読むもの: `main.sh`、`README.md`
- 書くもの: `wip/research/` の下だけ（入力ファイル、出力ファイル、手順のメモもここ）
- 調べる内容:
  1. 引数が 3 つ未満のときの表示と終了コード
  2. 入力ファイルが無いときの表示と終了コード
  3. 絞り込みパターンが空のときの動き（全行が残るか）
  4. パターンに正規表現の記号や `\` を含むときの動き（`index` による部分一致か）
  5. 行頭の空白の除き方と、番号の振り方
  6. 出力ファイル名（`<接頭辞>.txt`）と、一致する行が無いときに空の出力が残るか
  7. 出力先が書けない場合の動き（読むだけでよい。実行は `wip/research/` の中の出力先で行う）

## 対象外

- `main.sh` と `README.md` の変更
- `wip/research/` の外への書き込み（`scratchpad/` や、出力を別の場所に作ることも含む）
- 挙動を直す提案や実装。見つけた問題は summary に書くだけ

## 完了の確かめ方

- `wip/research/summary.md` があり、上の 1〜7 のそれぞれについて、観察した結果（実行したコマンドと出力、または該当の行）が書かれている
- 実行に使った入力ファイルと手順が `wip/research/` の中に残っている
- `ccnavi-git.sh status` で、変更されたファイルが `wip/research/` の中だけであることを確かめる

## 計画の理由

親の計画は調査 1 フェーズだけなので、子もこの 1 本にする。結果の判断は、承認後の次の作業としてユーザが決める。
