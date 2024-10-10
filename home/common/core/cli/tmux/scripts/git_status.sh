#!/usr/bin/env bash

thm_base="#1e1e2e"
thm_text="#cdd6f4"
thm_peachwater="#f5e0dc"
thm_flamingo="#f2cdcd"
thm_pink="#f5c2e7"
thm_mauve="#cba6f7"
thm_red="#f38ba8"
thm_maroon="#eba0ac"
thm_peach="#fab387"
thm_yellow="#f9e2af"
thm_green="#a6e3a1"
thm_teal="#94e2d5"
thm_sky="#89dceb"
thm_sapphire="#74c7ec"
thm_blue="#89b4fa"
thm_lavender="#b4befe"
thm_subtext_1="#a6adc8"
thm_subtext_0="#bac2de"
thm_overlay_2="#9399b2"
thm_overlay_1="#7f849c"
thm_overlay_0="#6c7086"
thm_surface_2="#585b70"
thm_surface_1="#45475a"
thm_surface_0="#313244"
thm_mantle="#181825"
thm_crust="#11111b"

cd "$1" || exit
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | grep -c -E "^(M| M)")
if test "$BRANCH" != ""; then
	if test "$STATUS" = "0"; then
		echo "#[bg=$thm_peach,fg=$thm_base]#[fg=$thm_base,bg=$thm_peach,italics]  $BRANCH #[bg=$thm_base,fg=$thm_peach]"
	else
		echo "#[bg=$thm_red,fg=$thm_base]#[fg=$thm_base,bg=$thm_red,italics]  $BRANCH #[bg=$thm_base,fg=$thm_red]"
	fi
else
	echo ""
fi
