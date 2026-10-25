---
title: 実行時に決まるコマンド名は書かない
type: pattern
description: $S のように実行時に決まるコマンド名は DENY_COMMAND_NAME_EXPANSION で止まる。スクリプトはパスを直接書く
tags: [ccnavi, shell, guard]
keywords: [DENY_COMMAND_NAME_EXPANSION, コマンド名, 変数, 展開]
sources: [feature-183-arg-research3-01-01]
---

コマンド名を変数に入れて呼ぶ（`$S args` のように実行時に決まる名前で起動する）と、`DENY_COMMAND_NAME_EXPANSION` で止まる。

- スクリプトのパスや実行ファイル名は、変数を介さず直接書く。
- 同じ処理を複数箇所で呼びたいときも、コマンド名を変数にせず、呼び出しを行ごとに書き下す。
