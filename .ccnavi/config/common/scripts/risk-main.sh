#!/bin/sh
# main.sh が差分に入っていれば 45 点、無ければ 0 点
if git diff --name-only "$CCNAVI_BASE_SHA" "$CCNAVI_HEAD" | grep -qx main.sh; then
	printf '{"points": 45, "message": "main.sh が変わった"}\n'
else
	echo 0
fi
