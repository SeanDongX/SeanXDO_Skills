# abtest Skill

This folder contains the `abtest` Codex skill for generating A/B test variants from a business goal and requested testing dimensions.

## Files

- `SKILL.md`: the actual skill definition.
- `examples.md`: reusable prompt and output examples for common A/B test scenarios.

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

## Expected Output

The skill should produce:

- Experiment goal and audience
- A control and one or more variants
- Clear hypothesis for each variant
- Primary and guardrail metrics
- Decision rule
- Tracking notes
