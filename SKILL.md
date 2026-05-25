---
name: ab-test-generator
description: Use when planning A/B tests, creating experiment variants, comparing messaging or product ideas, or turning requested dimensions into testable alternatives
---

# AB Test Generator

## Overview

This skill turns a target, audience, and requested dimensions into A/B test variants that are specific enough to ship and measure. The core rule is: every variant must isolate a clear hypothesis, define what changes, and state how success will be judged.

## When to Use

Use this when the user wants to:

- Generate A/B variants for copy, landing pages, ads, onboarding, pricing, emails, Instagram posts, product flows, or feature packaging.
- Test one or more dimensions such as headline, offer, CTA, proof, tone, visual direction, audience segment, pricing anchor, workflow order, or information density.
- Convert a vague idea into measurable experiments.
- Compare multiple positioning or creative directions without drifting away from the same business goal.

Do not use this for broad brainstorming with no testing intent. If the user only asks for creative options, create options first and add experiment framing only if useful.

## Required Inputs

If any input is missing, infer conservatively from context. Ask only when the missing piece would make the variants misleading.

| Input | Meaning |
| --- | --- |
| Goal | What the test should improve, for example signup, click, reply, purchase, activation, retention, or content engagement. |
| Audience | Who will see the test. |
| Surface | Where the variant appears: post, page, ad, modal, email, flow, pricing page, product UI, etc. |
| Dimensions | What should vary: copy, angle, CTA, layout, proof, tone, incentive, image, sequence, offer, etc. |
| Control | Existing version, baseline idea, or assumed default. |
| Constraints | Brand voice, legal claims, design limits, channel rules, implementation effort, traffic, time window. |

## Output Format

Always lead with the experiment recommendation, then provide variants.

```markdown
## Experiment

- Goal:
- Audience:
- Surface:
- Primary metric:
- Guardrail metric:
- Test principle:

## Variants

### A - Control / Baseline
- Hypothesis:
- Change:
- Creative / UX:
- Expected behavior:
- Risk:

### B - Variant Name
- Hypothesis:
- Change:
- Creative / UX:
- Expected behavior:
- Risk:

## Decision Rule

- Winner if:
- Inconclusive if:
- Stop or iterate if:

## Tracking Notes

- Event(s):
- Segment(s):
- Minimum sample / runtime assumption:
- What to log:
```

For more than one tested dimension, use a matrix instead of mixing everything into one variant:

| Variant | Dimension 1 | Dimension 2 | Hypothesis | Metric |
| --- | --- | --- | --- | --- |
| A | Baseline | Baseline | Existing approach performs acceptably. | Primary metric |
| B | Change | Baseline | Dimension 1 drives lift. | Primary metric |
| C | Baseline | Change | Dimension 2 drives lift. | Primary metric |

## Variant Rules

- Keep one primary dimension per A/B pair unless the user explicitly wants a multivariate test.
- Name variants by strategy, not letters only: `B - Proof First`, `C - Pain First`, `D - Offer First`.
- Make each change visible enough that a user could plausibly behave differently.
- Keep variants comparable: same audience, same traffic source, same timing, same metric.
- Do not create fake precision. If sample size is unknown, say what assumption is being made.
- Include a control even if the user only asks for new versions.
- Preserve the user's stated thesis, brand, and constraints. Do not optimize away the core idea.

## Common Dimensions

| Dimension | Useful Contrasts |
| --- | --- |
| Value proposition | Save time vs make more money vs reduce risk vs improve quality |
| Headline | Outcome-led vs problem-led vs identity-led vs curiosity-led |
| CTA | Low-friction action vs direct purchase/request vs diagnostic action |
| Proof | Testimonial vs metric vs before/after vs authority vs product evidence |
| Offer | Free trial vs audit vs discount vs bundle vs guarantee |
| Tone | Professional vs friendly vs urgent vs premium vs local/community |
| Visual | People vs product vs result vs process vs social proof |
| Flow order | Problem-first vs proof-first vs action-first vs education-first |
| Audience | Beginner vs expert, owner vs manager, new user vs returning user |

## Quality Checklist

Before returning the final answer, check:

- Each variant maps to the requested dimension.
- The variants are materially different, not just wording synonyms.
- The primary metric matches the goal.
- Guardrail metrics protect against false wins.
- The recommendation explains why these variants are worth testing now.
- The output can be handed to a designer, marketer, or engineer without another planning round.

## Compact Response Mode

If the user asks for a quick answer, use this shorter shape:

```markdown
推荐测试：
- A:
- B:
- 主要差异：
- 假设：
- 主指标：
- 风险：
- 下一步：
```
