# abtest Examples

Use these examples as patterns, not fixed templates. Preserve the user's stated goal, audience, surface, and constraints before choosing variants.

## 1. Local Business Instagram DM Test

Prompt:

```text
使用 abtest，帮我为餐饮 local business 的 Instagram post 生成 3 组 A/B 测试。
目标是提高私信咨询率，维度包括 headline、视觉方向、CTA。受众是附近 3 公里内的上班族。
```

Expected framing:

- Goal: increase DM inquiries.
- Surface: Instagram post.
- Primary metric: DM starts per reach.
- Guardrail metric: negative comments, hides, unfollows.
- A - Control: product photo plus generic offer.
- B - Problem First: lunch decision pain and speed.
- C - Proof First: real customer line, rating, or before/after order volume.
- Decision rule: choose the highest DM rate only if engagement quality does not drop.

## 2. SaaS Landing Page Signup Test

Prompt:

```text
/abtest 为一个 AI 周报 SaaS 的 landing page 设计 A/B 测试。
目标是提升 trial signup，维度是 headline angle 和 CTA。控制组是 "Automate your weekly reports"。
```

Expected framing:

| Variant | Headline Angle | CTA | Hypothesis | Metric |
| --- | --- | --- | --- | --- |
| A | Automation | Start free trial | Baseline automation promise attracts time-saving buyers. | Trial signup rate |
| B | Outcome | Get my first AI brief | A concrete first output reduces perceived setup cost. | Trial signup rate |
| C | Risk reduction | See what your team missed | Loss framing creates more urgency for operators. | Trial signup rate |

Tracking notes should include CTA click, signup start, signup complete, and source campaign.

## 3. Onboarding Activation Test

Prompt:

```text
帮我测试一个新用户 onboarding 流程。目标是提高首日 activation。
维度是流程顺序：先连接数据源，还是先展示 sample report。受众是刚注册的 SMB owner。
```

Expected framing:

- A - Connect First: ask for real business data before showing value.
- B - Sample First: show a realistic report before asking for connection.
- Primary metric: users who complete the activation event within 24 hours.
- Guardrail metric: connection completion rate and support tickets.
- Risk: sample-first may inflate interest but reduce serious setup intent.

## 4. Pricing Page Offer Test

Prompt:

```text
为 pricing page 设计 A/B 测试。目标是提高付费转化。
维度包括 pricing anchor 和 guarantee，但不要同时改太多。当前控制组是 $49/month self-serve plan。
```

Expected framing:

Use a matrix because the user named two dimensions:

| Variant | Pricing Anchor | Guarantee | Hypothesis | Metric |
| --- | --- | --- | --- | --- |
| A | $49/month | None | Existing plan is the baseline. | Paid conversion |
| B | $490/year with 2 months free | None | Annual anchor increases perceived value and commitment. | Paid conversion |
| C | $49/month | 14-day money-back | Risk reversal increases conversion without changing price. | Paid conversion |

Decision rule should avoid choosing a winner from revenue alone if refunds or support load spike.

## 5. Lifecycle Email Reply Test

Prompt:

```text
给一封 trial 第 5 天的 lifecycle email 做 A/B test。
目标是提高回复率和预约 demo。维度是 subject line、邮件开头、CTA。
```

Expected framing:

- A - Helpful Check-in: neutral subject and soft reply CTA.
- B - Missed Value: points to an unused feature or missing setup step.
- C - Demo Assist: direct offer to set up the account together.
- Primary metric: reply rate or demo bookings per delivered email.
- Guardrail metric: unsubscribe rate, spam complaint rate.
- What to log: subject, open, click, reply category, booking, account stage.

## 6. Product Feature Packaging Test

Prompt:

```text
我有一个 AI 功能，但用户不一定理解价值。帮我设计 A/B 测试比较不同 packaging。
目标是提升 feature adoption。维度是入口文案、证明方式、默认状态。
```

Expected framing:

Do not hide the AI value. Test whether visible rationale improves adoption:

- A - Tool Name Only: "Generate brief" with minimal explanation.
- B - Explainable AI: "Generate brief from your latest reviews and posts" plus source summary.
- C - Before/After Proof: preview the current manual state beside AI-generated output.
- Primary metric: feature started and completed.
- Guardrail metric: regenerated outputs, dismissals, low-quality feedback.
- Risk: visible AI proof may increase trust but also raise scrutiny.

## 7. Quick Compact Response

Prompt:

```text
快速给我一个广告 CTA 的 AB test，目标是提高点击。
```

Expected compact response:

```markdown
推荐测试：
- A: "Learn more"
- B: "Get the 5-minute audit"
- 主要差异：generic CTA vs diagnostic CTA
- 假设：具体的低成本动作会提高点击率
- 主指标：CTR
- 风险：点击提升但后续转化质量下降
- 下一步：同一广告素材、同一受众、同一预算跑 3-7 天
```
