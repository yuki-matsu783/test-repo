---
version: 1
ticket: feature-191-version-flag2-01-01
parent: feature-191-version-flag2
phase: 1
title: main.sh に --version を足す（実装とテスト）
human_review:
  required: true
  reason: 引数の受け取りを変えるため、既存の使い方が変わっていないかを人が見る
allow:
  - match: Write|Edit
    glob: "main.sh"
  - match: Write|Edit
    glob: "tests/*"
---
main.sh の先頭付近に版番号の定数（`VERSION="0.1.0"`）を置き、引数の先頭が `--version` のとき `main.sh <版番号>` ではなく版番号だけを 1 行表示して終了コード 0 で終わる処理を足す。`main` 関数の中で、引数の数を見る前に判定する。

テストは `tests/` に 1 本足す。`--version` の出力と終了コード 0、引数不足（終了コード 1）、入力ファイル無し（終了コード 1）の 3 つを、一時ディレクトリの中で確かめる。テストの実行方法（`sh tests/<名前>.sh` で回す形）も同じ 1 本の中に書く。

docs/wiki と .claude/skills は、この子では触らない（親の範囲には入っているが、今の作業に文書は要らない）。
