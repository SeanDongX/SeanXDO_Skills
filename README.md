# SeanXDO Skills

这个仓库收集可用于 Codex、Claude Code、OpenCode、OpenClaw / opneclaw 等本地 Agent 的 Skills。

English: [README.en.md](./README.en.md)

## Skills

| Skill | 路径 | 用途 |
| --- | --- | --- |
| AB 测试 | `ABTest/` | 规划 A/B 测试；当 A/B 版本文件开发完成后，生成带版本链接和截图对比的 HTML 对比页。 |
| 华为 Style PPT | `HWPptSkill/` | 生成华为风格单文件 HTML 演示文稿、配图和封面资产。 |

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

## HWPptSkill 使用方法

HWPptSkill 用来生成**单文件 HTML 横向翻页 PPT**，适合演讲、分享、产品发布、公司总结、商务汇报、配图和封面生成。

### 触发示例

安装后，直接对 Agent 说：

```text
帮我基于这篇文章做一份瑞士风 PPT，控制在 7 页左右，需要 2-3 张配图。
```

也可以使用这些请求：

```text
帮我把这份 Markdown 做成杂志风演讲 PPT。
参考华为企业汇报风格，做一份 10 页公司总结 PPT。
基于这份 PPT 的核心观点，生成一张公众号 21:9 头图。
把这张产品截图重新设计成适合 PPT 的 16:10 配图。
```

### 风格选择

| 风格 | 适合内容 | 模板 |
| --- | --- | --- |
| Style A · 电子杂志 × 电子墨水 | 人文分享、行业观察、观点表达、发布会叙事 | `assets/template.html` |
| Style B · 瑞士国际主义 | 科技产品、方法论、数据汇报、工程/设计分析 | `assets/template-swiss.html` |
| Style C · 华为企业汇报 | 公司总结、工作计划、商务汇报、部门复盘 | `assets/template-huawei.html` |

### 基本工作流

1. 选择风格：A 电子杂志风、B 瑞士风、C 华为企业汇报风。
2. 明确受众、时长、素材、图片/截图需求、主题色和硬约束。
3. 拷贝对应模板到目标目录，并创建同级 `images/` 文件夹。
4. 先规划页数和叙事节奏，再从对应 `references/layouts*.md` 选择版式。
5. 按模板填充 slide 内容，避免混用不同风格的 layout class。
6. 如需配图，在 Codex 中可让 Agent 生成照片、信息图、流程图、截图再设计或封面图。
7. 运行对应校验脚本，检查版式、图片槽位、品牌位、标题和危险 SVG。
8. 浏览器打开生成的 `index.html` 预览并迭代。

### 常用校验命令

```bash
node HWPptSkill/scripts/validate-swiss-deck.mjs path/to/index.html
node HWPptSkill/scripts/validate-huawei-deck.mjs path/to/index.html
```

更多规则见 [HWPptSkill/README.md](./HWPptSkill/README.md) 和 [HWPptSkill/SKILL.md](./HWPptSkill/SKILL.md)。

## Codex 用法

使用 slash command：

```text
/abtest 为 landing page 开发 A/B 两个 HTML 版本。完成后生成 abtest-guide.html，对比页第一屏给出 A/B 版本链接，并附截图对比。
```

Codex 当前安装位置：

- Skill: `~/.codex/skills/abtest/SKILL.md`
- Slash prompt: `~/.codex/prompts/abtest.md`

编辑 `ABTest/` 后，需要同步到 `~/.codex/skills/abtest/`，后续 `/abtest` 才会使用最新规则。
