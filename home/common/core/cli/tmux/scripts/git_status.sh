#!/usr/bin/env bash

thm_base="#191724"
thm_surface="#1f1d2e"
thm_overlay="#26233a"
thm_muted="#6e6a86"
thm_subtle="#908caa"
thm_text="#e0def4"
thm_love="#eb6f92"
thm_gold="#f6c177"
thm_rose="#ebbcba"
thm_pine="#31748f"
thm_pine2="#3e8fb0"
thm_foam="#9ccfd8"
thm_foam2="#56949f"
thm_iris="#c4a7e7"
thm_hl_low="#21202e"
thm_hl_med="#403d52"
thm_hl_high="#524f67"

cd "$1" || exit
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | grep -c -E "^(M| M)")
if test "$BRANCH" != ""; then
	if test "$STATUS" = "0"; then
		echo "#[bg=$thm_rose,fg=$thm_base]#[fg=$thm_base,bg=$thm_rose,italics]  $BRANCH #[bg=$thm_base,fg=$thm_rose]"
	else
		echo "#[bg=$thm_love,fg=$thm_base]#[fg=$thm_base,bg=$thm_love,italics]  $BRANCH #[bg=$thm_base,fg=$thm_love]"
	fi
else
	echo ""
fi
