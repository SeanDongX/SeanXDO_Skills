# SeanXDO Skills

这个仓库收集可用于 Codex、Claude Code、OpenCode、OpenClaw / opneclaw 等本地 Agent 的 Skills。

English: [README.en.md](./README.en.md)

## Skills

| Skill | 路径 | 用途 |
| --- | --- | --- |
| ABTest | `ABTest/` | 规划 A/B 测试；当 A/B 版本文件开发完成后，生成带版本链接和截图对比的 HTML 对比页。 |
| HWPptSkill | `HWPptSkill/` | 生成华为风格单文件 HTML 演示文稿、配图和封面资产。 |

## 安装

### 命令行安装

在本仓库目录下执行：

```bash
./scripts/install.sh codex abtest
./scripts/install.sh claude-code abtest
./scripts/install.sh opencode abtest
./scripts/install.sh openclaw abtest
```

安装全部 Skills：

```bash
./scripts/install.sh codex all
```

从 GitHub 一行安装：

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SeanDongX/SeanXDO_Skills/main/scripts/install.sh)" -- codex abtest
```

支持的 Agent 名称：`codex`、`claude-code`、`opencode`、`openclaw`。

### Claude Code

Claude Code 默认读取 `~/.claude/skills/`：

```bash
mkdir -p ~/.claude/skills
mkdir -p ~/.claude/skills/abtest ~/.claude/skills/guizang-ppt-skill
cp -R ABTest/. ~/.claude/skills/abtest/
cp -R HWPptSkill/. ~/.claude/skills/guizang-ppt-skill/
```

### Codex

Codex 默认读取 `~/.codex/skills/`。Slash command 是单独的 prompt 文件，位于 `~/.codex/prompts/`。

```bash
mkdir -p ~/.codex/skills ~/.codex/prompts
mkdir -p ~/.codex/skills/abtest ~/.codex/skills/guizang-ppt-skill
cp -R ABTest/. ~/.codex/skills/abtest/
cp -R HWPptSkill/. ~/.codex/skills/guizang-ppt-skill/
```

如果要使用 `/abtest`，还需要创建或更新 `~/.codex/prompts/abtest.md`，让它指向 `~/.codex/skills/abtest/SKILL.md`。

### OpenCode

OpenCode 常见 skill 目录是 `~/.opencode/skills/`：

```bash
mkdir -p ~/.opencode/skills
mkdir -p ~/.opencode/skills/abtest ~/.opencode/skills/guizang-ppt-skill
cp -R ABTest/. ~/.opencode/skills/abtest/
cp -R HWPptSkill/. ~/.opencode/skills/guizang-ppt-skill/
```

如果你的 OpenCode 配置了其他 skill 目录，把文件夹复制到对应目录即可。

### OpenClaw / opneclaw

OpenClaw 常见全局 skill 目录是 `~/.openclaw/skills/`；部分 workspace 模式也会读取 `~/.openclaw/workspace/skills/`。

```bash
mkdir -p ~/.openclaw/skills
mkdir -p ~/.openclaw/skills/abtest ~/.openclaw/skills/guizang-ppt-skill
cp -R ABTest/. ~/.openclaw/skills/abtest/
cp -R HWPptSkill/. ~/.openclaw/skills/guizang-ppt-skill/
```

workspace-local 安装：

```bash
mkdir -p ~/.openclaw/workspace/skills
mkdir -p ~/.openclaw/workspace/skills/abtest ~/.openclaw/workspace/skills/guizang-ppt-skill
cp -R ABTest/. ~/.openclaw/workspace/skills/abtest/
cp -R HWPptSkill/. ~/.openclaw/workspace/skills/guizang-ppt-skill/
```

如果你的客户端叫 `opneclaw`，安装方式相同，只需要按你的配置调整 skill 目录。

### 验证

每个安装后的 skill 文件夹都应该包含 `SKILL.md`：

```bash
ls ~/.codex/skills/abtest/SKILL.md
ls ~/.claude/skills/abtest/SKILL.md
ls ~/.opencode/skills/abtest/SKILL.md
ls ~/.openclaw/skills/abtest/SKILL.md
```

## ABTest 对比页要求

当 ABTest 创建或修改本地 A/B 版本文件时，最终交付必须包含 `abtest-guide.html` 对比页。

对比页必须首先给出 A/B 版本链接：

```html
<a href="./variant-a.html" target="_blank" rel="noopener">A - Control</a>
<a href="./variant-b.html" target="_blank" rel="noopener">B - Variant</a>
```

`abtest-guide.html` 至少包含：

1. 版本链接：使用相对路径，能新标签页打开每个 A/B 版本文件。
2. 截图对比：A 和 B 的渲染截图并排展示，尺寸可比。
3. 实验摘要：目标、受众、测试维度、假设、主指标和护栏指标。
4. Review checklist：链接有效性、视觉差异、截图新鲜度、埋点准备情况。

如果当前环境不能截图，也要生成 `abtest-guide.html`，保留占位图区域，并写明刷新截图的命令或浏览器步骤。

## Codex 用法

使用 slash command：

```text
/abtest 为 landing page 开发 A/B 两个 HTML 版本。完成后生成 abtest-guide.html，对比页第一屏给出 A/B 版本链接，并附截图对比。
```

Codex 当前安装位置：

- Skill: `~/.codex/skills/abtest/SKILL.md`
- Slash prompt: `~/.codex/prompts/abtest.md`

编辑 `ABTest/` 后，需要同步到 `~/.codex/skills/abtest/`，后续 `/abtest` 才会使用最新规则。
