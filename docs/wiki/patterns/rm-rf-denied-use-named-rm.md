---
title: rm -rf の代わりに名指しで消す
type: pattern
description: rm -rf の再帰削除は拒否される。消すものを名指しで rm -f し、空になった後で rmdir する
tags: [ccnavi, shell, guard]
keywords: [rm -rf, rm -f, rmdir, 再帰削除, 拒否]
sources: [feature-183-arg-research3-01-01]
---

`rm -rf` による再帰削除は拒否される。ディレクトリを丸ごと消す代わりに、

1. 消すファイルを名指しで `rm -f <パス>` する。
2. 中身が空になったディレクトリを `rmdir <パス>` で消す。

消す対象は先に一覧で確かめてから名指しする。
