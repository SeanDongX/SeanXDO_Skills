# ABTest Skill

This folder contains the `abtest` Codex skill for generating A/B test variants from a business goal and requested testing dimensions. When A/B versions are implemented as local files, the skill must also create an HTML comparison guide with direct links to each version and screenshot comparison.

## Files

- `SKILL.md`: the actual skill definition.
- `examples.md`: reusable prompt and output examples for common A/B test scenarios.

## Install

Command-line install from this repository:

```bash
./scripts/install.sh codex abtest
./scripts/install.sh claude-code abtest
./scripts/install.sh opencode abtest
./scripts/install.sh openclaw abtest
```

One-line install from GitHub:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SeanDongX/SeanXDO_Skills/main/scripts/install.sh)" -- codex abtest
```

Copy this folder into your agent's skill directory:

| Agent | Install path | Command |
| --- | --- | --- |
| Claude Code | `~/.claude/skills/abtest` | `mkdir -p ~/.claude/skills/abtest && cp -R ABTest/. ~/.claude/skills/abtest/` |
| Codex | `~/.codex/skills/abtest` | `mkdir -p ~/.codex/skills/abtest && cp -R ABTest/. ~/.codex/skills/abtest/` |
| OpenCode | `~/.opencode/skills/abtest` | `mkdir -p ~/.opencode/skills/abtest && cp -R ABTest/. ~/.opencode/skills/abtest/` |
| OpenClaw / opneclaw | `~/.openclaw/skills/abtest` | `mkdir -p ~/.openclaw/skills/abtest && cp -R ABTest/. ~/.openclaw/skills/abtest/` |

For Codex `/abtest`, also keep `~/.codex/prompts/abtest.md` pointing to `~/.codex/skills/abtest/SKILL.md`.

## Core Behavior

Use this skill when you need to:

- Plan a measurable A/B experiment.
- Create a control and one or more variants.
- Keep each A/B pair focused on one primary tested dimension.
- Package completed local A/B files for review.

## Implemented Variant Deliverables

When the task includes developing or modifying A/B version files, the final output must include:

| File | Requirement |
| --- | --- |
| `variant-a.html` or equivalent | Control / baseline version. |
| `variant-b.html` or equivalent | Variant version with one clear tested change. |
| Screenshot files | Rendered screenshots for A and B, preferably under `screenshots/`. |
| `abtest-guide.html` | HTML comparison guide with version links and screenshots. |

## `abtest-guide.html` Requirements

The comparison guide must place A/B version links first. Reviewers should be able to open each version with one click.

Required first section:

```html
<section class="version-links">
  <a href="./variant-a.html" target="_blank" rel="noopener">A - Control</a>
  <a href="./variant-b.html" target="_blank" rel="noopener">B - Variant</a>
</section>
```

Minimum sections, in order:

1. Version links: direct clickable links to every A/B version file, using relative paths and opening in a new tab.
2. Screenshot comparison: side-by-side screenshots of A and B at comparable dimensions.
3. Experiment summary: goal, audience, tested dimension, hypothesis, primary metric, and guardrail metric.
4. Reviewer checklist: link validity, visual difference, screenshot freshness, and tracking readiness.

If screenshot capture is blocked, still create `abtest-guide.html` with placeholder image slots and a note naming the command or browser step needed to refresh screenshots.

## Example Prompts

```text
使用 abtest，帮我为餐饮 local business 的 Instagram post 生成 3 组 AB 测试。
目标是提高私信咨询率，维度包括 headline、视觉方向、CTA。
```

```text
/abtest 为一个 AI 周报 SaaS 的 landing page 设计 A/B 测试。
目标是提升 trial signup，维度是 headline angle 和 CTA。控制组是 "Automate your weekly reports"。
```

```text
帮我测试一个新用户 onboarding 流程。目标是提高首日 activation。
维度是流程顺序：先连接数据源，还是先展示 sample report。受众是刚注册的 SMB owner。
```

```text
为 pricing page 设计 A/B 测试。目标是提高付费转化。
维度包括 pricing anchor 和 guarantee，但不要同时改太多。当前控制组是 $49/month self-serve plan。
```

```text
给一封 trial 第 5 天的 lifecycle email 做 A/B test。
目标是提高回复率和预约 demo。维度是 subject line、邮件开头、CTA。
```

```text
我有一个 AI 功能，但用户不一定理解价值。帮我设计 A/B 测试比较不同 packaging。
目标是提升 feature adoption。维度是入口文案、证明方式、默认状态。
```

```text
ABTest skill：为这个 landing page 做 A/B 两个 HTML 版本。完成开发后生成一个 abtest-guide.html，里面要有 A/B 文件链接和截图对比。
```

```text
/abtest 为产品页开发 A/B 两个 HTML 版本。完成后生成 abtest-guide.html，对比页第一屏必须给出 A/B 版本链接，链接要能直接打开两个版本，并附截图对比。
```

## Expected Output

The skill should produce:

- Experiment goal and audience
- A control and one or more variants
- Clear hypothesis for each variant
- Primary and guardrail metrics
- Decision rule
- Tracking notes
- For implemented variants: an `abtest-guide.html` review page with **clickable links that open each A/B version in a new tab** as the first section, side-by-side screenshots, experiment summary, and a reviewer checklist

## Codex Install Notes

The active Codex skill should be synced to:

- `~/.codex/skills/abtest/SKILL.md`
- `~/.codex/skills/abtest/README.md`
- `~/.codex/skills/abtest/examples.md`

The slash command prompt lives at:

- `~/.codex/prompts/abtest.md`
