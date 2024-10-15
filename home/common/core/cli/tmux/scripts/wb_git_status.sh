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

cd "$1" || exit 1
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
PROVIDER=$(git config remote.origin.url | awk -F '@|:' '{print $2}')

PROVIDER_ICON=""

PR_COUNT=0
REVIEW_COUNT=0
ISSUE_COUNT=0
BUG_COUNT=0

PR_STATUS=""
REVIEW_STATUS=""
ISSUE_STATUS=""
BUG_STATUS=""

RESET="#[fg=${thm_text},bg=${thm_base},nobold,noitalics,nounderscore,nodim]"

if [[ -z $BRANCH ]]; then
	exit 0
fi

if [[ $PROVIDER == "github.com" ]]; then
	if ! command -v gh &>/dev/null; then
		exit 1
	fi
	PROVIDER_ICON="$RESET#[fg=${thm_text}] "
	PR_COUNT=$(gh pr list --json number --jq 'length' | bc)
	REVIEW_COUNT=$(gh pr status --json reviewRequests --jq '.needsReview | length' | bc)
	RES=$(gh issue list --json "assignees,labels" --assignee @me)
	ISSUE_COUNT=$(echo "$RES" | jq 'length' | bc)
	BUG_COUNT=$(echo "$RES" | jq 'map(select(.labels[].name == "bug")) | length' | bc)
	ISSUE_COUNT=$((ISSUE_COUNT - BUG_COUNT))
elif [[ $PROVIDER == "gitlab.com" ]]; then
	if ! command -v glab &>/dev/null; then
		exit 1
	fi
	PROVIDER_ICON="$RESET#[fg=#fc6d26] "
	PR_COUNT=$(glab mr list | grep -cE "^\!")
	REVIEW_COUNT=$(glab mr list --reviewer=@me | grep -cE "^\!")
	ISSUE_COUNT=$(glab issue list | grep -cE "^\#")
else
	exit 0
fi

if [[ $PR_COUNT -gt 0 ]]; then
	PR_STATUS="#[fg=${thm_teal},bg=${thm_base},bold] ${RESET}${PR_COUNT} "
fi

if [[ $REVIEW_COUNT -gt 0 ]]; then
	REVIEW_STATUS="#[fg=${thm_peach},bg=${thm_base},bold] ${RESET}${REVIEW_COUNT} "
fi

if [[ $ISSUE_COUNT -gt 0 ]]; then
	ISSUE_STATUS="#[fg=${thm_teal},bg=${thm_base},bold] ${RESET}${ISSUE_COUNT} "
fi

if [[ $BUG_COUNT -gt 0 ]]; then
	BUG_STATUS="#[fg=${thm_maroon},bg=${thm_base},bold] ${RESET}${BUG_COUNT} "
fi

SEP="󰇝"
RSEP=""
# SEP="▒"
SEPARATOR="$RESET#[bg=${thm_base},fg=${thm_text},bold]$RSEP"

WB_STATUS="$RESET$PROVIDER_ICON $RESET$PR_STATUS$REVIEW_STATUS$ISSUE_STATUS$BUG_STATUS"

echo "$WB_STATUS"

# Wait extra time if status-interval is less than 5 minutes to
# avoid to overload GitHub API
INTERVAL=$(tmux display -p '#{status-interval}')
if [[ $INTERVAL -lt 300 ]]; then
	sleep 300
fi
