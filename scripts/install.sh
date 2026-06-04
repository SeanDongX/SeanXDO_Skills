#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/SeanDongX/SeanXDO_Skills.git"

usage() {
  cat <<'USAGE'
Usage:
  scripts/install.sh <agent> <skill>

Agents:
  codex
  claude-code
  opencode
  openclaw

Skills:
  abtest
  hwppt
  all

Examples:
  ./scripts/install.sh codex abtest
  ./scripts/install.sh claude-code all
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/SeanDongX/SeanXDO_Skills/main/scripts/install.sh)" -- codex abtest
USAGE
}

agent="${1:-}"
skill="${2:-}"

if [[ -z "$agent" || -z "$skill" || "$agent" == "-h" || "$agent" == "--help" ]]; then
  usage
  exit 0
fi

case "$agent" in
  codex)
    skill_root="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
    prompt_root="${CODEX_PROMPTS_DIR:-$HOME/.codex/prompts}"
    ;;
  claude-code|claude)
    skill_root="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
    prompt_root=""
    ;;
  opencode)
    skill_root="${OPENCODE_SKILLS_DIR:-$HOME/.opencode/skills}"
    prompt_root=""
    ;;
  openclaw|opneclaw)
    skill_root="${OPENCLAW_SKILLS_DIR:-$HOME/.openclaw/skills}"
    prompt_root=""
    ;;
  *)
    echo "Unknown agent: $agent" >&2
    usage
    exit 1
    ;;
esac

source_path="${BASH_SOURCE[0]:-}"
if [[ -n "$source_path" && -f "$source_path" ]]; then
  script_dir="$(cd "$(dirname "$source_path")" && pwd)"
  repo_root="$(cd "$script_dir/.." && pwd)"
else
  repo_root="$(pwd)"
fi
cleanup_dir=""

if [[ ! -d "$repo_root/ABTest" || ! -d "$repo_root/HWPptSkill" ]]; then
  cleanup_dir="$(mktemp -d)"
  if command -v git >/dev/null 2>&1; then
    git clone --depth 1 "$REPO_URL" "$cleanup_dir/repo" >/dev/null
  else
    echo "This install mode needs git when not run from a local checkout." >&2
    exit 1
  fi
  repo_root="$cleanup_dir/repo"
fi

copy_skill() {
  local source_dir="$1"
  local dest_name="$2"
  local dest_dir="$skill_root/$dest_name"

  mkdir -p "$dest_dir"
  cp -R "$source_dir/." "$dest_dir/"
  echo "Installed $dest_name -> $dest_dir"
}

install_abtest_prompt() {
  [[ "$agent" == "codex" ]] || return 0
  mkdir -p "$prompt_root"
  cat > "$prompt_root/abtest.md" <<'PROMPT'
---
description: Generate A/B test variants from goals, audiences, requested test dimensions, or completed variant files needing a review guide
argument-hint: goal, audience, surface, dimensions, constraints
---

Activate the abtest workflow.

Use the `abtest` skill if it is available. If the skill is not already loaded, read:

`~/.codex/skills/abtest/SKILL.md`

Input after `/abtest`:

```text
$ARGUMENTS
```

If the input is missing, ask the user for the test goal, audience, surface, and dimensions. If the input is partially specified, infer conservatively and state assumptions.

Return A/B test variants with goal, audience, surface, metrics, control, variants, hypotheses, exact changes, decision rule, and tracking notes.

If the task includes developing or modifying local A/B version files, also create an `abtest-guide.html` review page next to the outputs. The guide's first section must provide direct clickable links to each A/B version file, using relative paths and opening in a new tab. After the version links, include side-by-side screenshot comparison, the tested dimension, hypotheses, metrics, and a short reviewer checklist. If screenshots cannot be captured, include placeholder image slots and state the exact refresh step.
PROMPT
  echo "Installed /abtest prompt -> $prompt_root/abtest.md"
}

mkdir -p "$skill_root"

case "$skill" in
  abtest)
    copy_skill "$repo_root/ABTest" "abtest"
    install_abtest_prompt
    ;;
  hwppt|guizang-ppt-skill)
    copy_skill "$repo_root/HWPptSkill" "guizang-ppt-skill"
    ;;
  all)
    copy_skill "$repo_root/ABTest" "abtest"
    copy_skill "$repo_root/HWPptSkill" "guizang-ppt-skill"
    install_abtest_prompt
    ;;
  *)
    echo "Unknown skill: $skill" >&2
    usage
    exit 1
    ;;
esac

if [[ -n "$cleanup_dir" ]]; then
  rm -rf "$cleanup_dir"
fi

echo "Done."
