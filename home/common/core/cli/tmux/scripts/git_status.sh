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

RESET="#[fg=${thm_text},bg=${thm_base},nobold,noitalics,nounderscore,nodim]"
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | grep -cE "^(M| M)")

SYNC_MODE=0
NEED_PUSH=0

if [[ ${#BRANCH} -gt 25 ]]; then
	BRANCH="${BRANCH:0:25}…"
fi

STATUS_CHANGED=""
STATUS_INSERTIONS=""
STATUS_DELETIONS=""
STATUS_UNTRACKED=""

if [[ $STATUS -ne 0 ]]; then
	DIFF_COUNTS=($(git diff --numstat 2>/dev/null | awk 'NF==3 {changed+=1; ins+=$1; del+=$2} END {printf("%d %d %d", changed, ins, del)}'))
	CHANGED_COUNT=${DIFF_COUNTS[0]}
	INSERTIONS_COUNT=${DIFF_COUNTS[1]}
	DELETIONS_COUNT=${DIFF_COUNTS[2]}

	SYNC_MODE=1
fi

UNTRACKED_COUNT="$(git ls-files --other --directory --exclude-standard | wc -l | bc)"

if [[ $CHANGED_COUNT -gt 0 ]]; then
	STATUS_CHANGED="${RESET}#[fg=${thm_yellow},bg=${thm_base},bold] ${CHANGED_COUNT} "
fi

if [[ $INSERTIONS_COUNT -gt 0 ]]; then
	STATUS_INSERTIONS="${RESET}#[fg=${thm_green},bg=${thm_base},bold] ${INSERTIONS_COUNT} "
fi

if [[ $DELETIONS_COUNT -gt 0 ]]; then
	STATUS_DELETIONS="${RESET}#[fg=${thm_red},bg=${thm_base},bold] ${DELETIONS_COUNT} "
fi

if [[ $UNTRACKED_COUNT -gt 0 ]]; then
	STATUS_UNTRACKED="${RESET}#[fg=${thm_surface2},bg=${thm_base},bold] ${UNTRACKED_COUNT} "
fi

# Determine repository sync status
if [[ $SYNC_MODE -eq 0 ]]; then
	NEED_PUSH=$(git log @{push}.. | wc -l | bc)
	if [[ $NEED_PUSH -gt 0 ]]; then
		SYNC_MODE=2
	else
		LAST_FETCH=$(stat -c %Y .git/FETCH_HEAD | bc)
		NOW=$(date +%s | bc)

		# if 5 minutes have passed since the last fetch
		if [[ $((NOW - LAST_FETCH)) -gt 300 ]]; then
			git fetch --atomic origin --negotiation-tip=HEAD
		fi

		# Check if the remote branch is ahead of the local branch
		REMOTE_DIFF="$(git diff --numstat "${BRANCH}" "origin/${BRANCH}" 2>/dev/null)"
		if [[ -n $REMOTE_DIFF ]]; then
			SYNC_MODE=3
		fi
	fi
fi

# Set the status indicator based on the sync mode
SEP="󰇝"
RSEP="▒"
# SEP="▒"
case "$SYNC_MODE" in
1)
	REMOTE_STATUS="$RESET#[bg=${thm_base},fg=${thm_peach},bold]$RSEP 󱓎"
	;;
2)
	REMOTE_STATUS="$RESET#[bg=${thm_base},fg=${thm_teal},bold]$RSEP 󰛃"
	;;
3)
	REMOTE_STATUS="$RESET#[bg=${thm_base},fg=${thm_red},bold]$RSEP 󰛀"
	;;
*)
	REMOTE_STATUS="$RESET#[bg=${thm_base},fg=${thm_green},bold]$RSEP "
	;;
esac

if [[ -n $BRANCH ]]; then
	echo "$REMOTE_STATUS $BRANCH $RESET$STATUS_INSERTIONS$STATUS_CHANGED$STATUS_DELETIONS$STATUS_UNTRACKED"
fi
