---
version: 1
ticket: feature-173-main-sh-の使い方コメントに戻り値の例を-1-行足す-01-01
parent: feature-173-main-sh-の使い方コメントに戻り値の例を-1-行足す
phase: 1
title: main.sh の使い方コメントに戻り値の例を 1 行足す（実装）
human_review:
  required: true
  reason: 公開の使い方コメントの文言を変えるため、内容を人が確かめる
allow:
  - match: Write|Edit
    glob: "main.sh"
---
main.sh の冒頭コメント「例:」の節、`→ access.log から ERROR を含む行を取り…` の行の次に、
正常終了時の戻り値（終了コード 0）の例を 1 行足す。例の文言は「→ 正常に終わると終了コード 0。ERROR を含む行が無ければ errors.txt は空になる」の趣旨。
コードには触れない。
