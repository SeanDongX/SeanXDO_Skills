# SeanXDO Skills

This repository collects local agent skills used with Codex, Claude Code, and similar coding agents.

中文说明: [README.md](./README.md)

## Skills

| Skill | Path | Purpose |
| --- | --- | --- |
| ABTest | `ABTest/` | Plans A/B experiments and, after variant files are implemented, packages them into an HTML comparison guide. |
| HWPptSkill | `HWPptSkill/` | Generates single-file Huawei Style HTML presentation decks, visuals, and cover assets. |

## Install

Install one skill by copying its folder into the agent's skill directory. The destination folder name should match the skill name used by the agent, for example `abtest`.

### Command-line Install

From a local checkout of this repository:

```bash
./scripts/install.sh codex abtest
./scripts/install.sh claude-code abtest
./scripts/install.sh opencode abtest
./scripts/install.sh openclaw abtest
```

Install all skills:

```bash
./scripts/install.sh codex all
```

One-line install from GitHub:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SeanDongX/SeanXDO_Skills/main/scripts/install.sh)" -- codex abtest
```

Supported agents: `codex`, `claude-code`, `opencode`, `openclaw`.

### Claude Code

Claude Code reads local skills from `~/.claude/skills/`.

```bash
mkdir -p ~/.claude/skills
mkdir -p ~/.claude/skills/abtest ~/.claude/skills/guizang-ppt-skill
cp -R ABTest/. ~/.claude/skills/abtest/
cp -R HWPptSkill/. ~/.claude/skills/guizang-ppt-skill/
```

### Codex

Codex reads local skills from `~/.codex/skills/`. Slash commands are separate files under `~/.codex/prompts/`.

```bash
mkdir -p ~/.codex/skills ~/.codex/prompts
mkdir -p ~/.codex/skills/abtest ~/.codex/skills/guizang-ppt-skill
cp -R ABTest/. ~/.codex/skills/abtest/
cp -R HWPptSkill/. ~/.codex/skills/guizang-ppt-skill/
```

For `/abtest`, also create or update `~/.codex/prompts/abtest.md` so the command points to `~/.codex/skills/abtest/SKILL.md`.

### OpenCode

OpenCode installations commonly read skills from `~/.opencode/skills/`.

```bash
mkdir -p ~/.opencode/skills
mkdir -p ~/.opencode/skills/abtest ~/.opencode/skills/guizang-ppt-skill
cp -R ABTest/. ~/.opencode/skills/abtest/
cp -R HWPptSkill/. ~/.opencode/skills/guizang-ppt-skill/
```

If your OpenCode config uses another skill directory, copy the folders there instead.

### OpenClaw / opneclaw

OpenClaw installations commonly use `~/.openclaw/skills/` for global skills. Some workspace-mode setups also use `~/.openclaw/workspace/skills/`.

```bash
mkdir -p ~/.openclaw/skills
mkdir -p ~/.openclaw/skills/abtest ~/.openclaw/skills/guizang-ppt-skill
cp -R ABTest/. ~/.openclaw/skills/abtest/
cp -R HWPptSkill/. ~/.openclaw/skills/guizang-ppt-skill/
```

Workspace-local install:

```bash
mkdir -p ~/.openclaw/workspace/skills
mkdir -p ~/.openclaw/workspace/skills/abtest ~/.openclaw/workspace/skills/guizang-ppt-skill
cp -R ABTest/. ~/.openclaw/workspace/skills/abtest/
cp -R HWPptSkill/. ~/.openclaw/workspace/skills/guizang-ppt-skill/
```

If your client names the binary or config `opneclaw`, use the same folder-copy method and adjust only the configured skill directory.

### Verify

Each installed skill folder should contain `SKILL.md`.

```bash
ls ~/.codex/skills/abtest/SKILL.md
ls ~/.claude/skills/abtest/SKILL.md
ls ~/.opencode/skills/abtest/SKILL.md
ls ~/.openclaw/skills/abtest/SKILL.md
```

## ABTest Review Page Requirement

When ABTest creates or modifies local A/B version files, the final deliverable must include an `abtest-guide.html` comparison page.

The comparison page must put A/B version links first:

```html
<a href="./variant-a.html" target="_blank" rel="noopener">A - Control</a>
<a href="./variant-b.html" target="_blank" rel="noopener">B - Variant</a>
```

Minimum `abtest-guide.html` sections:

1. Version links: direct clickable links to every A/B version file, using relative paths and opening in a new tab.
2. Screenshot comparison: side-by-side screenshots of A and B at comparable dimensions.
3. Experiment summary: goal, audience, tested dimension, hypothesis, primary metric, and guardrail metric.
4. Reviewer checklist: link validity, visual difference, screenshot freshness, and tracking readiness.

If screenshots cannot be captured in the current environment, still create `abtest-guide.html` with placeholder image slots and a clear refresh step.

## HWPptSkill Usage

HWPptSkill generates **single-file HTML horizontal-swipe decks** for talks, product launches, company summaries, business reports, deck visuals, and social cover assets.

### Example Prompts

After installation, ask your agent:

```text
Create a Swiss-style deck from this article, around 7 slides, with 2-3 generated visuals.
```

Other useful prompts:

```text
Turn this Markdown file into an editorial magazine-style presentation.
Create a 10-slide company summary deck in the Huawei corporate report style.
Create a 21:9 social cover from the core idea of this deck.
Redesign this product screenshot as a 16:10 slide visual.
```

### Style Selection

| Style | Best For | Template |
| --- | --- | --- |
| Style A · Editorial magazine x electronic ink | Narrative talks, industry observations, opinion pieces, launch storytelling | `assets/template.html` |
| Style B · Swiss International | Tech products, frameworks, data reports, engineering/design analysis | `assets/template-swiss.html` |
| Style C · Huawei Corporate | Company summaries, work plans, business reports, team retrospectives | `assets/template-huawei.html` |

### Basic Workflow

1. Choose a style: A editorial, B Swiss, or C Huawei Corporate.
2. Clarify audience, duration, source material, image/screenshot needs, theme, and hard constraints.
3. Copy the matching template into the output folder and create a sibling `images/` folder.
4. Plan slide count and narrative rhythm, then choose layouts from the matching `references/layouts*.md`.
5. Fill slide content inside the template, avoiding mixed layout classes across styles.
6. In Codex, optionally ask the agent to generate photos, infographics, flow diagrams, screenshot redesigns, or cover images.
7. Run the matching validator to check layout, image slots, brand slots, titles, and unsafe SVG usage.
8. Open the generated `index.html` in a browser and iterate.

### Common Validation Commands

```bash
node HWPptSkill/scripts/validate-swiss-deck.mjs path/to/index.html
node HWPptSkill/scripts/validate-huawei-deck.mjs path/to/index.html
```

See [HWPptSkill/README.md](./HWPptSkill/README.md) and [HWPptSkill/SKILL.md](./HWPptSkill/SKILL.md) for the full rules.

## Codex Usage

Use the slash command:

```text
/abtest 为 landing page 开发 A/B 两个 HTML 版本。完成后生成 abtest-guide.html，对比页第一屏给出 A/B 版本链接，并附截图对比。
```

The active Codex installation reads:

- Skill: `~/.codex/skills/abtest/SKILL.md`
- Slash prompt: `~/.codex/prompts/abtest.md`

After editing `ABTest/`, sync the files into `~/.codex/skills/abtest/` so future `/abtest` runs use the latest rules.
