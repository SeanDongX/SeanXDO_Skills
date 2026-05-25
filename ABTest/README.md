# AB Test Skill

This folder contains a Codex skill for generating A/B test variants from a business goal and requested testing dimensions.

## Files

- `SKILL.md`: the actual skill definition.

## Example Prompt

```text
使用 AB Test Generator，帮我为餐饮 local business 的 Instagram post 生成 3 组 AB 测试。
目标是提高私信咨询率，维度包括 headline、视觉方向、CTA。
```

## Expected Output

The skill should produce:

- Experiment goal and audience
- A control and one or more variants
- Clear hypothesis for each variant
- Primary and guardrail metrics
- Decision rule
- Tracking notes
